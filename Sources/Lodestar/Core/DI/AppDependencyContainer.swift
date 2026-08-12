import Foundation

protocol HelthDataService {}
final class MockHelthDataService: HelthDataService { }


final class AppDependencyContainer {

    let helthDataService: HelthDataService

  init(
      helthDataService: HelthDataService
  ) {
      self.helthDataService = helthDataService
  }

}
