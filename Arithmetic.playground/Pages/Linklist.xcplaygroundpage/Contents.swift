//: [Previous](@previous)

import Foundation

// swift中的struct是值copy，不能达成链表指针效果
class Node {
    var value: String = " "
    var next: Node? = nil
}


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

func printLink( head: Node?) {
    var node = head
    while node != nil {
        print(node!.value, terminator: " -> ")
        node = node?.next
    }
    print("nil", terminator: "")
    print(" ")
}

func test() {
    var head : Node? = Node()
    head?.value = "100"
    head?.next = Node()
    head?.next?.value = "200"
    head?.next?.next = Node()
    head?.next?.next?.value = "300"
    head?.next?.next?.next = Node()
    head?.next?.next?.next?.value = "400"
    head?.next?.next?.next?.next = Node()
    head?.next?.next?.next?.next?.value = "500"
    printLink(head: head)
    head = reverseLinklist(head)
    printLink(head: head)
    head = reverseLinklist2(&head)
    printLink(head: head)
}

test()

//: [Next](@next)
