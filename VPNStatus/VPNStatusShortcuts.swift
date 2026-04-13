import AppIntents

struct ShowWorkVPNIntent: AppIntent {
    static var title: LocalizedStringResource = "Show Work VPN"
    static var description = IntentDescription("Start or update the Live Activity to Work VPN.")

    func perform() async throws -> some IntentResult {
        await LiveActivityManager.shared.show(status: .work)
        return .result()
    }
}

struct ShowExternalVPNIntent: AppIntent {
    static var title: LocalizedStringResource = "Show External VPN"
    static var description = IntentDescription("Start or update the Live Activity to External VPN.")

    func perform() async throws -> some IntentResult {
        await LiveActivityManager.shared.show(status: .external)
        return .result()
    }
}

struct ClearVPNIntent: AppIntent {
    static var title: LocalizedStringResource = "Clear VPN"
    static var description = IntentDescription("Stop the active VPN Live Activity.")

    func perform() async throws -> some IntentResult {
        await LiveActivityManager.shared.clear()
        return .result()
    }
}

struct SetVPNStatusIntent: AppIntent {
    static var title: LocalizedStringResource = "Set VPN Status"
    static var description = IntentDescription("Set VPN status manually and control the Live Activity.")

    @Parameter(title: "Status")
    var status: VPNStatus

    func perform() async throws -> some IntentResult {
        if status == .none {
            await LiveActivityManager.shared.clear()
        } else {
            await LiveActivityManager.shared.show(status: status)
        }

        return .result()
    }
}

struct VPNStatusShortcutsProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        [
            AppShortcut(intent: ShowWorkVPNIntent(), phrases: [
                "Show Work VPN in \(.applicationName)",
                "Set Work VPN in \(.applicationName)"
            ], shortTitle: "Show Work VPN", systemImageName: "building.2"),
            AppShortcut(intent: ShowExternalVPNIntent(), phrases: [
                "Show External VPN in \(.applicationName)",
                "Set External VPN in \(.applicationName)"
            ], shortTitle: "Show External VPN", systemImageName: "network"),
            AppShortcut(intent: ClearVPNIntent(), phrases: [
                "Clear VPN in \(.applicationName)",
                "Stop VPN Live Activity in \(.applicationName)"
            ], shortTitle: "Clear VPN", systemImageName: "xmark.circle"),
            AppShortcut(intent: SetVPNStatusIntent(), phrases: [
                "Set VPN status in \(.applicationName)"
            ], shortTitle: "Set VPN Status", systemImageName: "switch.2")
        ]
    }
}
