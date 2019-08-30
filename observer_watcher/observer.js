// 函数用来模拟视图更新，调用它即代表更新视图，内部可以是一些更新视图的方法
function cb(val) {
    // 渲染视图
    console.log("视图更新啦~");
}

// 通过 Object.defineProperty 来实现对对象的「响应式」化
function defineReactive(obj, key, val) {

    // 一个Dep类对象
    const dep = new dep();

    Object.defineProperty(obj, key, {
        enumerable: true, // 属性可枚举
        configurable: true, // 属性可被修改或者删除
        get: function reactiveGetter() {
            // 将Dep.target(即当前的Watcher对象存入dep的subs中)：依赖收集
            dep.addSup(Dep.target);
            return val;
        },
        set: function reactiveSetter(newVal) {
            if(newVal === val) return;
            // 在set的时候触发dep的notify来通知所有的Watcher对象更新视图
            dep.notify();
            cb(newVal);
        }
    })
}

// 传入一个 value（需要「响应式」化的对象），通过遍历所有属性的方式对该对象的每一个属性都通过 defineReactive 处理
function observer(value) {
    if(!value || (typeof value !== 'object')) {
        return;
    }

    Object.keys(value).forEach((key) => {
        defineReactive(value, key, value[key]);
    })
}

class Vue {
    // Vue构造类
    constructor(options) {
        this._data = options.data;
        observer(this._data);
        // 新建一个Watcher观察者对象，这时候Dep.target会指向这个watcher对象
        new Watcher();
        // 在这里模拟render过程，为了触发test属性的get函数
        console.log('render~', this._data.test);
    }
}

let o = new Vue({
    data: {
        test: "I am test."
    }
});

o._data.test = "hello world";

// 订阅者 Dep ，它的主要作用是用来存放 Watcher 观察者对象
class Dep {
    constructor() {
        // 用来存放Watcher观察者对象的数组
        this.subs = [];
    }

    // 在subs中添加一个Watcher对象的订阅操作
    addSub(sub) {
        this.subs.push(sub);
    }

    // 通知所有Watcher对象更新视图
    notify() {
        this.subs.forEach((sub) => {
            sub.update();
        })
    }
}

// 观察者Watcher
class Watcher {
    constructor() {
        // 在new一个Watcher对象时将该对象赋值给Dep.target，在get中会用到
        Dep.target = this;
    }

    // 更新视图的方法
    update() {
        console.log("视图更新啦~");
    }
}

Dep.target = null;