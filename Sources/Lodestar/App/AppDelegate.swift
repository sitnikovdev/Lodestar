import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLanchingWithOptions lanchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
       true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
        ) -> UISceneConfiguration {
              UISceneConfiguration(
                  name: "Default Configuration",
                  sessionRole: connectingSceneSession.role
              )
        }
}
