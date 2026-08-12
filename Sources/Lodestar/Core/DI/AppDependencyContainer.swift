import Foundation

protocol HealthDataService {}
final class MockHealthDataService: HealthDataService { }


final class AppDependencyContainer {

    let healthDataService: HealthDataService

  init(
      healthDataService: HealthDataService
  ) {
      self.healthDataService = healthDataService
  }

}
