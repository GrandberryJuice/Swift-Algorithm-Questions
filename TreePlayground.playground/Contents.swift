//: Playground - noun: a place where people can play

import UIKit


//             10
//            /  \
//          5     14
//         /      / \
//        1      11  20

class Node {
    var value:Int
    var leftChild:Node?
    var rightChild:Node?
    

    
    init(value:Int, leftChild:Node?, rightChild:Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

//left branch
let oneRootNode = Node(value: 1, leftChild: nil, rightChild: nil)
//let sevenRootNode = Node(value: 7, leftChild: nil, rightChild: nil)
let fiveRootNode = Node(value: 5, leftChild: oneRootNode, rightChild: nil)


//right branch
let twentyRootNode = Node(value: 20, leftChild: nil, rightChild: nil)
let elevenRootNode = Node(value: 11, leftChild: nil, rightChild: nil)
let fourteenRootNode = Node(value: 14, leftChild: elevenRootNode, rightChild: twentyRootNode)

//root node
let tenRootNode = Node(value: 10, leftChild: fiveRootNode, rightChild: fourteenRootNode)

//Look for a value in the tree
func search(node:Node?, searchValue:Int) ->Bool {
    if node?.value == nil {
        return false
    }
    
    if node?.value == searchValue {
        return true
    } else if  (searchValue < node!.value)  {
        return search(node: node?.leftChild, searchValue: searchValue)
    } else {
        return  search(node: node?.rightChild, searchValue: searchValue)
    }
}

//insert a value into the tree
func insertIntoTree(root:Node, value:Int) -> Node {
    
    if value <= root.value {
        Node(value: value, leftChild: insertIntoTree(root: root.leftChild!, value: value), rightChild: nil)
    } else {
        Node(value: value, leftChild: nil, rightChild: insertIntoTree(root: root.rightChild!, value: value))
    }
    
    return root
}

//PreOrder of Tree
func printPreorder(root:Node?) {
    if(root == nil) {
        return
    }
    print(root?.value ?? -1)
    printPreorder(root: root?.leftChild)
    printPreorder(root: root?.rightChild)
}

//Print only the right side of the tree
func printRightSideTree(root:Node?) {
    if(root == nil) {
        return
    }
    
    print(root?.value ?? -1)
    printRightSideTree(root: root?.rightChild)
}

//Get the max depth of the tree
func maxDepth(root:Node?) -> Int {
    
    if (root?.leftChild == nil && root?.rightChild == nil) {
        return 0
    }
    
    var leftMax = 1 + maxDepth(root: root?.leftChild)
    var rightmax = 1 + maxDepth(root: root?.rightChild)
    
    return max(leftMax, rightmax)
}

maxDepth(root: tenRootNode)

//Have the tree to mirror itself
/*  Tip move leftChild node to rightChild & rightChild to leftChild
    throws error on compile time :-(
 */
func mirrorTree(root:Node?) {
    
    mirrorTree(root: root?.leftChild)
    mirrorTree(root: root?.rightChild)
    
    var temp:Node = (root!.rightChild)!
    root?.rightChild = root?.leftChild
    root?.leftChild = temp
    
}

//Print nodes with no siblings
func printNodenoSiblings(root:Node?) {
    if (root == nil) {
        return
    }
    
    if (root?.leftChild == nil && root?.rightChild == nil) {
        print(root?.rightChild ?? -1)
    }
    
    if (root?.rightChild == nil && root?.leftChild == nil) {
        print(root?.leftChild ?? -1)
    }
    
    printNodenoSiblings(root: root?.leftChild)
    printNodenoSiblings(root: root?.rightChild)
}

printNodenoSiblings(root: tenRootNode)



