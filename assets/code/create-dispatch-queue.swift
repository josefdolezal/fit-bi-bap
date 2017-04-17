import Foundation

func createBackgroundQueue() -> DispatchQueue {
    return DispatchQueue(
        label: "My Queue",
        qos: DispatchQoS.background
    )
}
