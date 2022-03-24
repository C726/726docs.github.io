# Axios

## Install
```bash
npm install axios   --save
```

## Use
```javascript



export default {
    name: "Login",
    setup() {
        const data = reactive({
            username: '',
            password: '',
        })
        const router = useRouter()
        const handleLogin = async () => {
            try {
                const result = await axios.post('url', {usernme: data.username, password: data.password})
                if (result?.data?.errno === 0 ){
                    // to login
                }else{
                    alert("Failed")
                }
            }cache{
                alert("Failed")
            }
            
        }
    }
}
```

## Request
```javascript
// Vue project director: src/utils/request.js
import axios from 'axios';
export const post = (url, data = {}) => {
    return new Promise((resolve, reject) => {
        axios.post(url, data, {
            baseURL: 'https://www.baidud.com',
            headers: {
                'Content-Type': 'application/json',
            }
        }).then((response) => {
            resolve(respose)
            //resolve(respose.data)  只返回data
        }, err => {
            reject(err)
        })
    })
}
```