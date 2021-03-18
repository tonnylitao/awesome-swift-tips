import Foundation

public protocol Resource {
    init()
    static func fetch(completion: @escaping (Self) -> Void)
}

public extension Resource {
    static func fetch(completion: @escaping (Self) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            completion(Self())
        }
    }
}

public struct User: Resource {
    public init() {}
}
extension Array: Resource where Element: Resource {}
