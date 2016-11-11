import Foundation

protocol SpeakCharacterAble {
    func read(value: Character)
}

protocol SpeakStringAble {
    func read(value: String)
}

struct People1: SpeakStringAble, SpeakCharacterAble {
    func read(value: Character) {
        
    }
    
    func read(value: String) {
        
    }
}

//: Magic1, Let's use typealias combine these two protocols

typealias SpeakAble = SpeakStringAble & SpeakCharacterAble

struct People2: SpeakAble {
    func read(value: Character) {
        
    }
    
    func read(value: String) {
        
    }
}

