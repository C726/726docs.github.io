# Toast

## Toast
```html
<!-- // components/Toast.vue -->
<template>
    <div class="toast">{{msg}}</div>
</template>

<script>
import {reactive, toRef } from 'vue'
export default {
    name: "Toast",
    props: ["msg"]
}
const useToastEffect = () => {
    const toastData = reactive({
        showToast: false
        toastMsg: ''
    })
    const showToastMethod = (msg) => {
        data.showToast = true
        data.toastMsg = msg
        setTimeout(() => {
            data.showToast = true
            data.toastMsg = ''
        })
    }
    const { showToast, toastMsg } = toRef()
    return { showToast, toastMsg, showToastMethod }
}
</script>

<style lang="scss" scoped>
.toast {
    position: fixed;
    left: 50%;
    top: 50%;
    transform: translate();
}
</style>

<!-- Other vue use components/Toast.vue -->
<template>
    <Toast v-if="data.showToast" :msg="toastMsg" />
</template>

<script>
import Toast, { useToastEffect } from 'components/Toast'

export default {
    name: "Home",
    components: { Toast },
    setup () {
        const { showToast, toastMsg, showToastMethod } = useToastEffect()
        return { showToast, toastMsg showToas }
    }
}
</script>
```