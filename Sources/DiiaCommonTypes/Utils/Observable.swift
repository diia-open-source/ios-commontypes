
import Foundation

public final class Observable<T> {
    public typealias GenericClosure = (T) -> Void
    private final class Observation {
        let closure: GenericClosure
        weak var observer: AnyObject?
        
        init(observer: AnyObject, closure: @escaping GenericClosure) {
            self.closure = closure
            self.observer = observer
        }
    }
    
    public var value: T {
        get {
            lock.lock(); defer { lock.unlock() }
            return _value
        }
        set {
            lock.lock()
            _value = newValue
            let snapshot = observations
            lock.unlock()
            snapshot.forEach { _, observation in
                observation.closure(newValue)
            }
        }
    }
    
    private var _value: T
    private let lock = NSRecursiveLock()
    private var observations = [UUID: Observation]()
    
    public init(value: T) {
        self._value = value
    }
    
    public func observe(observer: AnyObject, triggerNow: Bool = true, _ closure: @escaping GenericClosure) {
        lock.lock()
        let id = UUID()
        observations[id] = .init(observer: observer) { [weak self, weak observer] value in
            guard let self else { return }
            guard observer != nil else {
                self.lock.lock(); defer { self.lock.unlock() }
                self.observations.removeValue(forKey: id)
                return
            }
            closure(value)
        }
        let currentValue = _value
        lock.unlock()
        if triggerNow { closure(currentValue) }
    }
    
    public func removeObserver(observer: AnyObject) {
        lock.lock(); defer { lock.unlock() }
        let idsToRemove = observations.filter { _, observation in
            if let valueObserver = observation.observer {
                return valueObserver.isEqual(observer)
            }
            return true
        }.keys
        idsToRemove.forEach {
            observations.removeValue(forKey: $0)
        }
    }
}
