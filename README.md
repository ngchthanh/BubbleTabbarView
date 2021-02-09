# BubbleTabbarView
<img src="https://i.imgur.com/GM6IWjp.gif" width="414" height="856">

## Requirements

- iOS 14.0+
- Xcode 12.4

## Installation

Just add the BubbleTabbarView folder to your project.

or [Swift Package Manager](https://swift.org/package-manager/)

## Usage
1. Implement BubbleTabItemable protocol for custom tabItem view
2. Create a new BubbleTabbarView and pass TabItems 

## Example
``` swift
enum Tabs: String, BubbleTabItemable {
    var id: String {
        return rawValue
    }
    
    case home
    case box
    case bell
    case profile
    case game
    
    var image: String {
        switch self {
        case .home:
            return "house.fill"
        case .box:
            return "shippingbox.fill"
        case .bell:
            return "bell.fill"
        case .profile:
            return "person.2.fill"
        case .game:
            return "gamecontroller.fill"
        }
    }
    
    var view: AnyView {
        switch self {
        case .home:
            return AnyView(Text(""))
        case .box:
            return AnyView(Text(""))
        case .bell:
            return AnyView(Text(""))
        case .profile:
            return AnyView(Text(""))
        case .game:
            return AnyView(Text(""))
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .home:
            return Color.blue
        case .box:
            return Color.red
        case .bell:
            return Color.green
        case .profile:
            return Color.orange
        case .game:
            return Color.gray
        }
    }
    
    var selectedColor: Color {
        return Color.red
    }
    
    var deselectedColor: Color {
        return Color.gray
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
```
``` swift
@main
struct TestSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            BubbleTabbarView(tabItems: Tabs.allCases, selectedTabItem: .home)
        }
    }
}
```
