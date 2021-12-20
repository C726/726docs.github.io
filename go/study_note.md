# Golang常用代码片段
## Golang执行流程图
![](/images/golang_running_flow.png)

## 时间格式化
```go
time.now().Format("2006-01-02 15:04:05")
```

## 嵌套匿名结构体
```go

configData := struct {
    Collection struct{
        PushgatewayIp string
        PushgatewayPort int
        PushgatewayUser string
        PushgatewayPassword string
    }
}{
    Collection: struct {
        PushgatewayIp string
        PushgatewayPort int
        PushgatewayUser string
        PushgatewayPassword string
    }{
        "192.168.10.180",
        pushgatewayPort,
        pushgatewayUser,
        pushgatewayPassword,
    },
}
```

## 读取JSON文件
```go
// 使用结构体读取JSON文件
var configFileData Config
f, e := os.Open(configFile)
if e!=nil{fmt.Println(e)}
configDecoder := json.NewDecoder(f)
configDecoder.Decode(&configFileData)
f.Close()

// 使用非结构体读取文件
fmt.Println("Read json file with unstructured data")
f, e = os.Open(configFile)
if e!=nil{fmt.Println(e)}
var ret map[string]interface{}
byteValue, _ := ioutil.ReadAll(f)
json.Unmarshal([]byte(byteValue), &ret)
fmt.Println(ret)
f.Close()

// MAP 转为JSON
fmt.Println("Map to json")
jsonstr, _ := json.Marshal(ret)
fmt.Println(string(jsonstr))
```

## 调用函数写入文件时，需要os.O_WRONLY
```go

type SyncWriter struct {
	m sync.Mutex
	Writer io.Writer
}

func (w *SyncWriter) Write(b []byte) (n int, err error) {
	w.m.Lock()
	defer w.m.Unlock()
	return w.Writer.Write(b)
}

fl, e = os.OpenFile(*outputFile, os.O_APPEND|os.O_CREATE|os.O_WRONLY, os.ModeAppend)
wr := &SyncWriter{}
fmt.Fprintln(wr, "string")

```

## 解析map[string]interface{}接收的JSON数据,支持两级
```go
/*
支持的数据格式为：
{
    "xxxx":[
        {
            "id": 1,
            "xxxx2": true,
            "xxxx3": "xxxx3",
            "xxxx4": [
                {
                    id": 1,
                    "xxxx2": true,
                    "xxxx3": "xxxx3",
                }
            ],
        },
    ],
    "xxxx2": {
        id": 1,
        "xxxx2": true,
        "xxxx3": "xxxx3",
    },
    "xxxx3": 1,
    "xxxx4": true,
    "xxxx5": "xxxx3",
}
*/
func (cvt *CloudTable) parserData(d string) ([]map[string]interface{}, int) {
	var rets []map[string]interface{}
	var size int = 0
	jsonData := make(map[string]interface{})
	e := json.Unmarshal([]byte(d), &jsonData)
	if e != nil {
		logger.Error("Json parse error: ", e)
		return rets,size
	}

	var jd *reflect.MapIter
	jd = reflect.ValueOf(jsonData).MapRange()
	// 过程式解析返回的数据
	for jd.Next() {
		switch jd.Key().String() {
		case "meta":  // 数据格式为map
			metaRange := reflect.ValueOf(jd.Value().Interface()).MapRange()
			for metaRange.Next() {
				if metaRange.Key().String() == "total" { size,_ = strconv.Atoi(metaRange.Value().String())}
			}
		case "data": // 数据格式为slice
			s := reflect.ValueOf(jd.Value().Interface())
			for i:=0;i<s.Len(); i++ {
				ret := make(map[string]interface{})
				dataRange := reflect.ValueOf(s.Index(i).Interface()).MapRange()
				for dataRange.Next() {
					key := dataRange.Key().String()
					switch key {
					case "id":
						ret[key] = reflect.ValueOf(dataRange.Value().Interface()).Float()
					default:
						dataValue := reflect.ValueOf(dataRange.Value().Interface())
						dataType := dataValue.Kind().String()
						switch dataType {
						case "float64","float32":
							ret[key] = dataValue.Float()
						case "bool":
							ret[key] = dataValue.Bool()
						case "slice":
							s1 := reflect.ValueOf(dataValue.Interface())
							for j:=0;j<s1.Len();j++{
								s1DataRange := reflect.ValueOf(s1.Index(j).Interface()).MapRange()
								for s1DataRange.Next() {
									s1Key := s1DataRange.Key().String()
									s1DataValue := reflect.ValueOf(s1DataRange.Value().Interface())
									s1DataType := s1DataValue.Kind().String()
									switch s1DataType {
									case "float64","float32":
										ret[key+"."+ strconv.Itoa(j) + "." +s1Key] = s1DataValue.Float()
									case "bool":
										ret[key+"."+ strconv.Itoa(j) + "." +s1Key] = s1DataValue.Bool()
									default:
										ret[key+"."+ strconv.Itoa(j) + "." +s1Key] = s1DataValue.String()
									}
								}
							}
						case "map":
							mapRange := reflect.ValueOf(dataValue.Interface()).MapRange()
							for mapRange.Next() {
								mapKey := mapRange.Key().String()
								mapDataValue := reflect.ValueOf(mapRange.Value().Interface())
								mapDataType := mapDataValue.Kind().String()
								switch mapDataType {
								case "float64","float32":
									ret[key+"."+mapKey] = mapDataValue.Float()
								case "bool":
									ret[key+"."+mapKey] = mapDataValue.Bool()
								default:
									ret[key+"."+mapKey] = mapDataValue.String()
								}
							}
						default:
							ret[key] = dataValue.String()
						}
					}
				}
				rets = append(rets, ret)
			}
		}
	}
	return rets, size
}
```