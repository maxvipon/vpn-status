import ActivityKit
import SwiftUI
import WidgetKit

struct VPNStatusLiveActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: VPNActivityAttributes.self) { context in
            VStack(spacing: 8) {
                Text("VPN Status")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(context.state.status.label)
                    .font(.title3.weight(.semibold))
            }
            .padding()
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    Text(context.state.status.label)
                        .font(.headline)
                }
            } compactLeading: {
                Image(systemName: "lock.shield")
            } compactTrailing: {
                Text(context.state.status.shortLabel)
                    .font(.caption2)
            } minimal: {
                Text(context.state.status.shortLabel)
                    .font(.caption2)
            }
        }
    }
}
