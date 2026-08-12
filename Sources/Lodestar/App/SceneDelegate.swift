import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var coordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }

        let window = UIWindow(windowScene: windowScene)

        let dependencies = AppDependencyContainer(
            healthDataService: MockHealthDataService()
        )

        let coordinator = AppCoordinator(
            window: window,
            dependencies: dependencies
        )

        self.window = window
        self.coordinator = coordinator

        coordinator.start()
    }
}
