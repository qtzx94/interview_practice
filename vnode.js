// VNode 就是一个 JavaScript 对象，用 JavaScript 对象的属性来描述当前节点的一些状态
class VNode {
    constructor(tag, data, children, text, elm) {
        // 当前节点标签名
        this.tag = tag;
        // 当前节点的一些数据信息， 如props、attrs等数据
        this.data = data;
        // 当前节点的子节点，是一个数组
        this.children = children;
        // 当前节点的文本
        this.text = text;
        // 当前虚拟节点对应的真实dom节点
        this.elm = elm;
    }
}

// Vue组件
<template>
    <span class="demo" v-show="isShow">
        This is a span
    </span>    
</template>

// 用JavaScript代码形式表示
function render() {
    return new VNode(
        'span',
        {
            // 指令集合数组
            directives: [
                {
                    // v-show指令
                    rawName: 'v-show',
                    expression: 'isShow',
                    name: 'show',
                    value: true
                }
            ],
            // 静态class
            staticClass: 'demo'
        },
        [ new VNode(undefined, undefined, undefined, 'This is a span') ]
    )
}

// 转化成VNode
{
    tag: 'span',
    data: {
        // 指令集合数组
        directives: [
            {
                // v-show指令
                rawName: 'v-show',
                expression: 'isShow',
                name: 'show',
                value: true
            }
        ],
        // 静态class
        staticClass: 'demo'
    },
    text: undefined,
    children: [
        // 子节点是一个文本VNode节点
        {
            tag: undefined,
            data: undefined,
            text: 'This is a span',
            children: undefined
        }
    ]
}

// 创建一个空节点
function createEmptyVNode() {
    const node = new VNode();
    node.text = '';
    return node;
}

// 创建一个文本节点
function createTextVnode(val) {
    return new VNode(undefined, undefined, undefined, String(val));
}

// 克隆一个VNode节点
function cloneVNode(node) {
    const cloneVnode = new VNode(
        node.tag,
        node.data, 
        node.children,
        node.text,
        node.elm
    );
    return cloneVnode;
}
