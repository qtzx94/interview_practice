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