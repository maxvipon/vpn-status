import ActivityKit
import Foundation

struct VPNActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var status: VPNStatus
    }

    var name: String
}
