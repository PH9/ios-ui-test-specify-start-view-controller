# ios-ui-test-specify-start-view-controller

This repo is POC is start UITesting with difference storyboard. It may help you to specify which story you want to tests. So the result of specific storyboard to start may help you test finish faster by not enter since first storyboard.

## Example

We create a contract that we will put a storyboard name in Environment Variable named `startWithStoryboardName`

In test files you must specify which storyboard you want to start.

```Swift
let app = XCUIApplication()
app.launchEnvironment = ["startWithStoryboardName": "StoryBlack"]
app.launch()
```

and in `AppDelegate` you must provide way to start with from storyboard name.

```Swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let viewController = startFromStoryboard() {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = viewController
            window?.makeKeyAndVisible()
        }

        return true
    }

    private func startFromStoryboard(bundle: Bundle? = nil) -> UIViewController? {
        guard let name = ProcessInfo.processInfo.environment["startWithStoryboardName"] else {
            return nil
        }

        guard let viewController = UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController() else {
            return nil
        }

        return viewController
    }
}
```
