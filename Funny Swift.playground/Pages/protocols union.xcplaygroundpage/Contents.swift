import Foundation

protocol CharacterSpeakable {
    func read(value: Character)
}

protocol StringSpeakable {
    func read(value: String)
}

//: normal way to implement multiple protocols

struct People1: CharacterSpeakable, StringSpeakable {
    func read(value: Character) {
        
    }
    
    func read(value: String) {
        
    }
}

//: combine two protocols with &

typealias Speakable = CharacterSpeakable & StringSpeakable

struct People2: Speakable {
    func read(value: Character) {
        
    }
    
    func read(value: String) {
        
    }
}







