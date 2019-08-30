function fn(resolve) {
    setTimeout(function() {
        resolve(123);
    }, 3000);
}

let p0 = new Promise(fn);
// let p1 = Promise.resolve(p0);
// console.log(p0 === p1);
let p1 = Promise.resolve(123);
// console.log(p1);


// const promise = new Promise(function(resolve, reject) {
//     if(success) {
//         resolve(value);
//     }else {
//         reject(value);
//     }
// });

// promise.then(function(value) {
//     // success
// }, function(error) {
//     // failure
// })

// function timeout(ms) {
//     return new Promise((resolve, reject) => {
//         setTimeout(resolve, ms, 'done');
//     });
// }

// timeout(5000).then((value) => {
//     console.log(value);
// })

// let promise = new Promise(function(resolve, reject) {
//     console.log('Promise');
//     resolve();
// });

// promise.then(function() {
//     console.log('resolved.');
// });

// console.log('Hi');

// // Promise
// // Hi
// // resolved.


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