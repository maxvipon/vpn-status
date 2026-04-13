# VPNStatus (iOS Live Activity + Shortcuts)

A tiny SwiftUI iPhone app that shows a **manually selected VPN state** in a Live Activity / Dynamic Island.

> This app intentionally **does not** detect the real iOS VPN connection.
> It only shows the state passed from App Intents / Shortcuts.

## Features

- Live Activity with Dynamic Island support.
  - Expanded UI shows clear status text.
  - Compact/minimal Dynamic Island shows a short status label.
- Shortcuts actions:
  - **Show Work VPN**
  - **Show External VPN**
  - **Clear VPN**
  - **Set VPN Status** (enum parameter: `work`, `external`, `none`)
- Simple app screen with current status + test buttons.
- Persisted status in shared App Group defaults.

## Project structure

- `VPNStatus/` — main app target (SwiftUI app + App Intents)
- `VPNStatusWidget/` — Widget extension target (Live Activity / Dynamic Island UI)
- `Shared/` — status enum, activity attributes, and live activity manager

## Requirements

- Xcode 15+
- iOS 17+
- Apple Developer signing configured for app + widget extension

## How to run

1. Open `VPNStatus.xcodeproj` in Xcode.
2. In **Signing & Capabilities** for both targets:
   - Set your Team.
   - Set a unique Bundle Identifier.
   - Ensure **App Groups** is enabled on both targets using the same group ID.
3. If needed, update the App Group ID constant in `Shared/VPNStatus.swift`.
4. Build and run on an iPhone (Dynamic Island requires supported hardware).

## Add shortcuts in iPhone Shortcuts

1. Open the **Shortcuts** app.
2. Create or edit your VPN automation shortcut.
3. Add one of this app's actions after your real VPN action:
   - **Show Work VPN**
   - **Show External VPN**
   - **Clear VPN**
   - or **Set VPN Status** and choose a value.
4. Run the shortcut.

## Expected behavior

- **Show Work VPN** starts or updates a Live Activity to `Work VPN`.
- **Show External VPN** starts or updates it to `External VPN`.
- **Clear VPN** ends any active VPNStatus Live Activity.

## Known limitation (intentional)

This app reflects only the manually selected state from app buttons or shortcuts. It does not inspect or verify the actual system VPN state.
