## How this project help you

When you are develop web app in FB Messenger, you can use this project and iOS simulator to debug in different version of mobile webview.

You can modify webview width and height in ViewController.swift setupUI method:

```
view.backgroundColor = UIColor.white
view.addSubview(webView)
webView.navigationDelegate = self
let width:CGFloat = view.bounds.width
let height:CGFloat = 500
webView.frame = CGRect(x: 0, y: view.bounds.maxY - height, width: width, height: height)
```

[How to use simulator with safari web inspector](https://webdesign.tutsplus.com/articles/quick-tip-using-web-inspector-to-debug-mobile-safari--webdesign-8787)

[What you can do if simulator not show in safari dev tool ](https://forums.developer.apple.com/thread/67110)

[How to run older iOS version](https://stackoverflow.com/questions/4262018/xcode-simulator-how-to-run-older-ios-version/8477254)

