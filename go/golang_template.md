# Golang template used
## 在rang里面访问外部变量
```go
/*
 * 问题： 在遍历products时，需要与外部的一个pid变量进行对比时，在rang里面不能使用pid变量
 * 方法一： 定义一个template变量：{{$pid:=.pid}}；在rang里面使用$pid即可
 * 方法二： 直接在rang中使用{{$.pid}}
 */
<div class="row">
    {{ .pid }}
    <hr />
    {{$pid:=.pid}}
    {{range .products }}
        {{if eq $.pid .Id }}
            <div class="col-md-3 bg-success">{{$.pid}} {{$pid}} ++++ {{.Id}} ==>> {{.Name}}</div>
        {{end}}
    {{ end }}
</div>
```