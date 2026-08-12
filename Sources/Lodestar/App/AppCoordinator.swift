import UIKit

final class AppCoordinator {

  private let window: UIWindow
  private let dependencies: AppDependencyContainer

  init(
      window: UIWindow,
      dependencies: AppDependencyContainer
  ) {
    self.window = window
    self.dependencies = dependencies
  }

  func start() {
      let navigationController = UINavigationController()

      let homeCoordinator = HomeCoordinator(
          navigationController: navigationController,
          dependencies: dependencies
      )

      homeCoordinator.start()

      window.rootViewController = navigationController
      window.makeKeyAndVisible()
  }
}
