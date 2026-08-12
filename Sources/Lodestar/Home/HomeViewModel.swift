import Foundation

final class HomeViewModel: BaseViewModel {

  private let healthDataService: HealthDataService

  init(healthDataService: HealthDataService) {
      self.healthDataService = healthDataService
      super.init()
  }

  override func onViewDidLoad() {
      super.onViewDidLoad()

      state.value = .loading

      // Пока используем mock.
      // Реальный Open Wearables подключим в М2
      state.value = .loaded
  }
}
