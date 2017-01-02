
class Earth {}
protocol StopAble {}

extension Earth {
    func stopQuake() {
        
    }
}

// VS

extension StopAble where Self: Earth {
    func stopQuake() {
        
    }
}


////

import Foundation
import PlaygroundSupport

/*
如何有效地给类和对象添加新方法？
传统OOP只能使用继承Inheritance或者实现接口Interface，这个两种方法都很直接'高效'，但终究引入了新的实体，增加了复杂度，面对千奇百怪的别人的新世界（各种继承，各种新类），有时真是蓝瘦香菇。
 Swift中的Extension对原来的世界赋予了新的功能；传统OOP的程序员只能羡慕鼓掌👏。
 */

class Boy {}
//extension Boy {
//    func dateWithLover() {
//        print("💑")
//    }
//}

/*
 但Extension有个显著的缺点，就是不能重载Override
 */

class GayBoy: Boy {}
//extension GayBoy {
//    func dateWithLover() { //Error，无法重载，想掰弯都不行😅
//        print("💑")
//    }
//}

/*
 引入接口／协议（Protocol），协议描述了一个世界，这个世界中万事万物都满足这个协议（废话，🔄循环死锁了）
 此处的协议就指dateWithLover行为，换句话就是能分泌荷尔蒙的世界。
 Boy, GayBoy字面量上划分了不同的实体，但并没有表达出他们的本质。人类总是先看这个世界的表面，因为这些简单直观，其次才是通过各种方法论观察总结其中内在逻辑。如果人类的思维方式能跳过表象，直接从内在逻辑出发，这个世界将会怎样？（思考脸，地震震通我的任通二脉了？）
 */

protocol DateAble { //定义一个能分泌荷尔蒙的Boy世界
    func dateWithLover() //这个世界里万事万物都有这样的行为
}

extension Boy: DateAble {
    func dateWithLover() {
        print("💑")
    }
}

//extension GayBoy: DateAble {
//    func dateWithLover() {
//        print("💑")
//    }
//}


/*
 Ops，再次失败，证明上面想多了。。。
 到目前，Extension的确很糟糕，但至少轻松干倒继承。
 为了大家的幸福，程序员只能再想想办法，💪
 Swift中，Extensions不仅能扩展类／对象，也能扩展协议，协议被扩展，所有满足改协议的实体功能也被扩展，扩展协议相当于间接地扩展实体。
 另外，扩展协议时我们可以指定实体范围，比如对某些男扩展某协议，对某些男扩展另外协议。哇～ cool
 */


//extension Boy: DateAble {} //指定所有Boy都属于这个世界
//extension DateAble where Self: Boy { //指定所有男
//    func dateWithLover() {
//        print("💑")
//    }
//}
//
//extension DateAble where Self: GayBoy { //指定某些男
//    func dateWithLover() {
//        print("👨‍❤️‍👨") //终于变成两男
//    }
//}

Boy().dateWithLover() //💑
GayBoy().dateWithLover() //👨‍❤️‍👨

/*完成任务，祝你们幸福
 上面都是废话，真正干货:
 */

import CoreData

class User : NSManagedObject {}
class Topic : NSManagedObject {}

protocol ApiFetch {}
protocol CoreDataFetch {}
typealias FetchAble = CoreDataFetch & ApiFetch

extension NSManagedObject : FetchAble {} //it's important

extension CoreDataFetch where Self: NSManagedObject { // ‘where Self: NSManagedObject’ should not be removed
    
    static func localFetch(with id: Int, completion: @escaping ((Self?)->Void) ) {
        // find in coredata
        
        DispatchQueue.main.async {
            completion(Self())
        }
    }
}

User.localFetch(with: 2) { user in }
Topic.localFetch(with: 2) { user in }


extension ApiFetch {
    
    typealias FetchCompletion = (NSData?, Error?) -> Void

    static func remoteFetch(with id: Int, completion: @escaping FetchCompletion) -> URLSessionDataTask {
        
        let path = "api/\(Self.self)/\(id)" // api/User/@{}
        
        //      request from server
        
        DispatchQueue.main.async {
            completion(nil, nil)
        }
        return URLSessionDataTask()
    }
}

extension ApiFetch where Self: User {
    
    static func remoteMe(completion: @escaping ((Self?)->Void) ) {
        
        // find in coredata
        
        DispatchQueue.main.async {
            completion(Self())
        }
    }
}

User.remoteFetch(with: 1) { _, _ in }
Topic.remoteFetch(with: 1) { _, _ in }

User.remoteMe { user in }



/*知道大家懒，总结一下：
 Extension功能：
    能扩展实体，但无法处理类簇中父子函数同名冲突。
    能扩展协议，扩展协议相当于间接扩展实体，扩展时能指定实体范围。
    能隔离代码，相似逻辑放在同一个扩展里，世界顿时干净不少。
 
 希望这个世界每个人都有这个Extension能力，你爸爸扩展变强大了，你也能变强大，你不仅能扩展物质条件，也能扩展能力才华，甚至能指定某些能力在某些物质里扩展。
 
 下次继续聊聊 空Protocol连通不同世界。如果我忘了，请提醒我：）
 */

protocol Dao {}


PlaygroundPage.current.needsIndefiniteExecution = true;
