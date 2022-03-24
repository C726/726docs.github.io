# VueX

## Modify Data
```javascript
// 1. .vue 文件中使用 dispatch 方法， 派发一个 action
// 2. store/index.js 中的 action 添加一个 action 并提交 commit
// 3. stror/index.js 中的 mutation 添加一个对应的 mutation 进行修改

// mutation 不能有异步代码，只可写同步代码
// 需要异步时，使用 action 

// dispatch 与 action 关联
// mutation 与 commit 关联
```