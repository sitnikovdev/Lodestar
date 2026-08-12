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
      let viewController = UIViewController()
      viewController.view.backgroundColor = .white

      window.rootViewController = viewController
      window.makeKeyAndVisible()
  }
}
