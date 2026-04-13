import SwiftUI

struct ContentView: View {
    @State private var status = VPNStatus.loadFromDefaults()

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Current status")
                    .font(.headline)
                Text(status.label)
                    .font(.title2.weight(.semibold))

                Button("Show Work VPN") {
                    Task {
                        await LiveActivityManager.shared.show(status: .work)
                        status = .work
                    }
                }
                .buttonStyle(.borderedProminent)

                Button("Show External VPN") {
                    Task {
                        await LiveActivityManager.shared.show(status: .external)
                        status = .external
                    }
                }
                .buttonStyle(.borderedProminent)

                Button("Clear VPN") {
                    Task {
                        await LiveActivityManager.shared.clear()
                        status = .none
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .navigationTitle("VPN Status")
        }
        .onAppear {
            status = VPNStatus.loadFromDefaults()
        }
    }
}
