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