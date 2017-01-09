//: [Previous](@previous)

import Foundation

//: ## 链表的数据结构及方法
public class Node { /// swift中的struct是值copy，不能达成链表指针效果
    var value: String = " "
    var next: Node? = nil
    
    /// 打印链表
    func show()  {
        var node = self as Node?
        while node != nil {
            print(node!.value, terminator: " -> ")
            node = node?.next
        }
        print("nil", terminator: "")
        print(" ")
    }
    
    static func fillNode() -> Node? {
        let head : Node? = Node()
        head?.value = "100"
        head?.next = Node()
        head?.next?.value = "200"
        head?.next?.next = Node()
        head?.next?.next?.value = "300"
        head?.next?.next?.next = Node()
        head?.next?.next?.next?.value = "400"
        head?.next?.next?.next?.next = Node()
        head?.next?.next?.next?.next?.value = "500"
        return head
    }
}
//: ## 链表反转
/// 循环方式反转链表
func reverseLinklist(_ headNode: Node?) -> Node? {
    guard headNode != nil || headNode?.next != nil else {
        return headNode
    }
    
    var currentNode = headNode
    var resultNode: Node? = nil
    var next :Node?
    
    while currentNode != nil {
        next = currentNode?.next
        currentNode?.next = resultNode
        resultNode = currentNode
        currentNode = next
    }
    return resultNode
}

/// 递归方式反转链表
func reverseLinklist2(_ head: inout Node?) -> Node? {
    if head == nil || head?.next == nil  {
        return head
    }else {
        let newHead = reverseLinklist2(&head!.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
}


func test1() {
    var head = Node.fillNode()
    head?.show()
    head = reverseLinklist(head)
    head?.show()
    head = reverseLinklist2(&head)
    head?.show()
}

test1()

//: ##找到倒数第k个结点
func reciprocalValueOfLinked(head: inout Node?, at index: Int) -> Node? {
    
    guard index > 0 || head != nil else { // 初始条件判断
        return nil
    }
    var point: Node? = head
    // 移动参照点到指定位置
    for _ in 1..<index {
        if  point?.next != nil {
            point = point?.next
        }else { // 没有k个元素
            return nil
        }
    }
    // 以参照点为参照开始找倒数第k个结点
    while point?.next != nil {
        head = head?.next
        point = point?.next
    }
    return head
}

func test2() {
    var head = Node.fillNode()
    let result = reciprocalValueOfLinked(head: &head, at: 2)
    print(result?.value ?? "没有找到倒数第K个数")
}

test2()
//: ## 
//: [Next](@next)
