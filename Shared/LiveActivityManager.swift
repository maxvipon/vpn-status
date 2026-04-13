import ActivityKit
import Foundation

@MainActor
final class LiveActivityManager {
    static let shared = LiveActivityManager()

    private init() {}

    func show(status: VPNStatus) async {
        status.saveToDefaults()

        if let existing = Activity<VPNActivityAttributes>.activities.first {
            await existing.update(using: .init(status: status))
            return
        }

        let attributes = VPNActivityAttributes(name: "VPN Status")
        let content = ActivityContent(state: .init(status: status), staleDate: nil)

        do {
            _ = try Activity.request(attributes: attributes, content: content)
        } catch {
            print("Failed to request activity: \(error)")
        }
    }

    func clear() async {
        VPNStatus.none.saveToDefaults()

        for activity in Activity<VPNActivityAttributes>.activities {
            await activity.end(nil, dismissalPolicy: .immediate)
        }
    }
}
