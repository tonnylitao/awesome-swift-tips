//一堆苹果，很多空篮子，尽量把大小最接近的苹果放在一个篮子里

import Foundation

extension Array {
    
    /// 数组截成二维数组
    /// maxCount 子数组长度不超过maxCount
    /// evaluate 元素的的求值算法
    /// neighborDistance 子数组中相邻元素满足Predicate条件
    
    func dyadicArrayWithMaxLength(maxCount:Int,
                                  evaluate: @escaping ((Element) -> Double),
                                  neighborPredicate:((Element, Element) -> Bool)) -> [[Element]] {

        if self.count == 0 {
            return []
        }
        
        //第1步，先截成子数组，子数组中的元素满足Predicate条件
        var arr = [[Element]]()
        arr.append([Element]())
        let output = self.reduce(arr) { (results, item) -> [[Element]] in
            
            var temps = results
            var row = results.last!
            
            if let last = row.last, !neighborPredicate(last, item) {
                temps.append([item])
                return temps
            }else {
                row.append(item) //添加到子数组
                
                temps.removeLast()
                temps.append(row)
                
                return temps
            }
        }
        
        //第2步，对长度超过count的子数组进行递归截断
        return output.reduce([]) { (results: [[Element]], row:[Element]) -> [[Element]] in
            var temps = results
            
            if row.count <= maxCount {
                assert(row.count > 0, "count is 0")
                temps.append(row)
                return temps
            }else{
                let arr = row.maxDistanceSlice(maxCount: maxCount, evaluate: evaluate)
                temps.append(contentsOf: arr)
                return temps
            }
        }
    }
    
    /// 递归截断数组，直到子数组长度满足count限制
    private func maxDistanceSlice(maxCount:Int, evaluate:@escaping ((Element) -> Double)) -> [[Element]]{
        if self.count <= maxCount {
            return [self]
        }else{
            var results = [[Element]]()
            
            let range = self.indexOfMinVariance(maxCount: maxCount, evaluate: evaluate)
            let starIndex = range.lowerBound, endIndex = range.upperBound
            
            var subs0 = [Element]()
            if (starIndex > 0) {
                subs0 = Array(self[0..<starIndex])
                results.append(contentsOf: subs0.maxDistanceSlice(maxCount: maxCount, evaluate: evaluate))
            }
            
            let subs1 = Array(self[range])
            results.append(subs1)
            assert(subs1.count == maxCount, "range error")
            
            var subs2 = [Element]()
            if (endIndex < self.count) {
                subs2 = Array(self.suffix(from: Index(endIndex)))
                results.append(contentsOf: subs2.maxDistanceSlice(maxCount: maxCount, evaluate: evaluate))
            }
            
            return results
        }
    }

    /// 找出数组中方差最小的位置
    private func indexOfMinVariance(maxCount:Int, evaluate:@escaping ((Element) -> Double)) -> Range<Int> {
        var iAndV: (index:Int, value:Double) = (0, Double.infinity)
        
        for i in 0...self.count-maxCount {
            let subArr = Array(self[i..<i+maxCount])
            let dis = subArr.variance(evaluate: evaluate)
            
            debugPrint("variance: \(i)-\(i+maxCount-1) \(dis)")
            if dis < iAndV.value {
                iAndV.value = dis
                iAndV.index = i
            }
        }
        
        return iAndV.index..<(iAndV.index + maxCount)
    }
    
    //n个数据的方差
    private func variance(evaluate:@escaping ((Element) -> Double)) -> Double {
        let count = Double(self.count)
        //        assert(count == 9, "count is not right")
        
        //求和 同时 求数组
        var values = [Double]()
        let total:Double = self.reduce(0.0) { (result:Double, e:Element) -> Double in
            let v = evaluate(e)
            values.append(v)
            
            return result + v
        }
        
        let average = total/count
        let sum = values.reduce(0.0, {$0 + pow(($1-average), 2.0)})
        
        return sum/count
    }
}

[1, 2, 3, 5, 6, 67, 89, 90].dyadicArrayWithMaxLength(maxCount: 3, evaluate: { (i) -> Double in
    return i
}) { (i, j) -> Bool in
    return j-i <= 1
}
