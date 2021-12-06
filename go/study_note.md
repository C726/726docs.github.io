# 

## 匿名结构体
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
