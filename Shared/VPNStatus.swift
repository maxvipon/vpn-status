import AppIntents
import Foundation

public enum VPNStatus: String, CaseIterable, Codable, AppEnum {
    case work
    case external
    case none

    public static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "VPN Status")

    public static var caseDisplayRepresentations: [VPNStatus: DisplayRepresentation] = [
        .work: DisplayRepresentation(title: "Work VPN"),
        .external: DisplayRepresentation(title: "External VPN"),
        .none: DisplayRepresentation(title: "No VPN")
    ]

    public var label: String {
        switch self {
        case .work:
            return "Work VPN"
        case .external:
            return "External VPN"
        case .none:
            return "No VPN"
        }
    }

    public var shortLabel: String {
        switch self {
        case .work:
            return "Work"
        case .external:
            return "Ext"
        case .none:
            return "Off"
        }
    }

    public static let appGroupID = "group.com.example.vpnstatus"
    private static let defaultsKey = "selectedVPNStatus"

    public static func loadFromDefaults() -> VPNStatus {
        guard
            let defaults = UserDefaults(suiteName: appGroupID),
            let value = defaults.string(forKey: defaultsKey),
            let status = VPNStatus(rawValue: value)
        else {
            return .none
        }
        return status
    }

    public func saveToDefaults() {
        UserDefaults(suiteName: VPNStatus.appGroupID)?.set(rawValue, forKey: VPNStatus.defaultsKey)
    }
}
