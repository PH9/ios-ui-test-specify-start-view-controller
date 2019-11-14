import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
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

