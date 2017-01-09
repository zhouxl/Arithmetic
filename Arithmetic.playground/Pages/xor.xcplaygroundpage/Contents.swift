//: [Previous](@previous)

import Foundation

/// 给定一组不重复的数，包含0，1，2......n，求出第一个miss的整数，比如[0,1,3]返回2
func missingNum(nums: [Int]) -> Int {
    var result = 0;
    for i in 0..<nums.count {
        result ^= i
        result ^= nums[i]
        if result != 0 { // 当出现result不为0时,说明出了第一个miss的整数，也不需要继续再找了
            result ^= nums[i]
            break
        }
        
    }
    return result
}

let A = [0,1,2,7]
print( missingNum(nums: A))


/// 判断一个数是否是2的n次方

func is2Power(num: Int) -> Bool {
    return (num & (num - 1)) == 0
}

let B = 18
print(is2Power(num: B))
//: [Next](@next)
