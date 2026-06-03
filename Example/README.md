# QuickActionsKit 示例 App

最小 Demo：首页 + 详情页，演示主屏幕快捷操作。

## 运行

```bash
cd Example
pod install
open Demo.xcworkspace
```

在 Xcode 选择 **demo2** scheme 运行。

> 示例通过 GitHub 上的库标签 `1.0.0` 集成。若你刚改了上一级 `Sources/` 源码还未发布，请用仓库外的 [demo2 工程](../../demo2)（`:path => './QuickActionsKit'`）联调。

## 验证

1. 运行 App，看到「首页」
2. 切到后台
3. 长按主屏幕 App 图标
4. 点「回到首页」或「打开详情」

## 文件

| 文件 | 作用 |
|------|------|
| `Demo/AppDelegate.swift` | `setup` |
| `Demo/SceneDelegate.swift` | `bind` / `handle` / `refresh` |
| `Demo/QuickActionItem+Demo.swift` | 快捷项与跳转 |
| `Demo/HomeViewController.swift` | 首页 |
| `Demo/DetailViewController.swift` | 详情页 |
