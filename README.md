# GCD
Grand Central Dispatch GCD ,  Low Lvl C API, conform FIFO. 


Main dispatch (serial)
Global (concurrent)
Private Queues(can be serial or concurrent, by default serial)



### Sync vs Async
Sync wait for finished the block, return control when finish the work
Async execute the block but no wait the finish the work


### DeadLock
```Swift 
 
 // Deadlock(error) it's not possible.
 DispatchQueue.main.sync 

```

### Data Race:
https://www.avanderlee.com/swift/concurrent-serial-dispatchqueue/


```swift

final class Messenger {

    private var messages: [String] = []

    private var queue = DispatchQueue(label: "messages.queue", attributes: .concurrent)

    var lastMessage: String? {
        return queue.sync {
            messages.last
        }
    }

    func postMessage(_ newMessage: String) {
        queue.sync(flags: .barrier) {
            messages.append(newMessage)
        }
    }
}

let messenger = Messenger()
// Executed on Thread #1
messenger.postMessage("Hello SwiftLee!")
// Executed on Thread #2
print(messenger.lastMessage) // Prints: Hello SwiftLee!

```
