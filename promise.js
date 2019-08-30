/**
 * Promise，是一种容器，里面保存着某个未来才会结束的事情（通常是一个异步操作），从语法上，Promise是一个对象，可以用以获取异步操作的消息
 * 优点： 
 * 1.一旦状态改变，就不会再变，任何时候都可以得到这个结果
 * 2.可以将异步操作以同步操作的流程表达出来，避免了层层嵌套的回调函数
 * 
 * 缺点：
 * 1.无法取消Promise
 * 2.当处于pending状态时，无法得知目前进展到哪一阶段
 * 3.错误不能被try catch
 */
const promise = new Promise(function(resolve, reject) {
    if(success) {
        resolve(value);
    }else {
        reject(value);
    }
});

promise.then(function(value) {
    // success
}, function(error) {
    // failure
})

function timeout(ms) {
    return new Promise((resolve, reject) => {
        setTimeout(resolve, ms, 'done');
    });
}

timeout(5000).then((value) => {
    console.log(value);
})

let promise = new Promise(function(resolve, reject) {
    console.log('Promise');
    resolve();
});

promise.then(function() {
    console.log('resolved.');
});

console.log('Hi');

// Promise
// Hi
// resolved.


// 图片加载的异步操作
function loadImageAsync(url) {
    return new Promise(function(resolve, reject) {
        const image = new Image();

        image.onload = function() {
            resolve(image);
        };

        image.error = function() {
            reject(new Error('Could not load image at ' + url));
        };

        image.src = url;
    })
}

// // Promise对象实现ajax操作
// const getJSON = function(url) {
//     const promise = new Promise(function(resolve, reject) {
//         const handler = function() {
//             if(this.readyState !== 4) {
//                 return;
//             }
//             if(this.status === 200) {
//                 resolve(this.response);
//             }else {
//                 reject(new Error(this.statusText));
//             }
//         };

//         const client = new XMLHttpRequest();
//         client.open("GET", url);
//         client.onreadystatechange = handler;
//         client.responseType = "json";
//         client.setRequestHeader("Accept", "application/json");
//         client.send();

//     });

//     return promise;
// };

// getJSON("/posts.json").then(function(json) {
//     console.log('Contents: ' + json);
// }, function(error) {
//     console.error('出错了', error);
// });

var fn = function() {}

console.log(fn.prototype);