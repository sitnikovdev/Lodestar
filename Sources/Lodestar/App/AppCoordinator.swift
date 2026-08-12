import UIKit

final class AppCoordinator {

  private let window: UIWindow

  init(window: UIWindow) {
    self.window = window
  }

  func start() {
      let viewController = UIViewController()
      viewController.view.backgroundColor = .white

      window.rootViewController = viewController
      window.makeKeyAndVisible()
  }
}
