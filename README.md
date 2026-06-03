# QuickActionsKit

主屏幕快捷操作（Home Screen Quick Actions）简易封装：`setup` + `bind` + `handle`。

## 安装

### Swift Package Manager（GitHub）

Xcode → **File → Add Package Dependencies**，填入仓库地址，或 `Package.swift`：

```swift
.package(url: "https://github.com/<你的用户名>/QuickActionsKit.git", from: "1.0.0")
```

### Swift Package Manager（本地开发）

```swift
.package(path: "../QuickActionsKit")
```

### CocoaPods（cocoapods-spm，GitHub）

```ruby
plugin 'cocoapods-spm'
spm_pkg 'QuickActionsKit', :git => 'https://github.com/<你的用户名>/QuickActionsKit.git', :tag => '1.0.0'
```

### CocoaPods（本地路径）

```ruby
plugin 'cocoapods-spm'
spm_pkg 'QuickActionsKit', :path => './QuickActionsKit'
```

## 用法

```swift
import QuickActionsKit

// AppDelegate
QuickActionsKit.setup(actions: QuickActionItem.demoItems)

// SceneDelegate
QuickActionsKit.bind(pendingShortcut: connectionOptions.shortcutItem) { item in
    item.navigate(using: nav) // 业务方自己实现
}

// 热启动
func windowScene(..., completionHandler: @escaping (Bool) -> Void) {
    completionHandler(QuickActionsKit.handle(shortcutItem))
}

// 进后台前刷新
func sceneWillResignActive(_ scene: UIScene) {
    QuickActionsKit.refresh()
}
```

## API

| 方法 | 说明 |
|------|------|
| `setup(actions:)` | 注册快捷菜单 |
| `bind(pendingShortcut:onSelect:)` | 设置点击回调，可选冷启动项 |
| `handle(_:)` | 解析并分发快捷项 |
| `refresh()` | 按 availability 刷新菜单 |
| `pushIfNeeded(_:on:excluding:)` | 通用 push 辅助 |
