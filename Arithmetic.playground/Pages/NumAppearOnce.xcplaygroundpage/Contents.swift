//: Playground - noun: a place where people can play

import UIKit

//: ## 寻找出现一次的数字

/// 一个整形数组中，除了一个数字出现一次外，其它都出现两次，找出这个数字。
/// 解题思路：任何一个数字异或它自己都等于0


let A = [1,2,1,3,2,5,3]
func singleNumOfRepeatTwo(nums: [Int]) -> Int {
    var temp = 0
    for v in nums {
        temp = temp ^ v
    }
    return temp
}

let result = singleNumOfRepeatTwo(nums: A)


///一个整形数组中，除了一个数字出现一次外，其它都出现三次，找出这个数字。
/// 解题思路：一个整形是四个byte，即32位，每个数字都可以表示成一个32位的0、1串，用一个32大小的数组记录数组中所有数字中每一位1出现的次数，然后对每一位对3取余，最后数组表示的数即是出现一次的

func singleNumOfRepeatThree(nums: [Int]) -> Int {
    var bits = Array.init(repeating: 0, count: 32)
    for i in 0..<nums.count {
        for j in 0..<bits.count {
            bits[j] += ((nums[i] >> j) & 1)
        }
    }
    var result = 0
    for i in 0..<bits.count {
        if bits[i] % 3 != 0 {
            result += (1 << i)
        }
    }
    return result
}

let B = [1,1,1,2,2,2,3,3,3,4]
let b = singleNumOfRepeatThree(nums: B)