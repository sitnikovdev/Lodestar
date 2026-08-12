import XCTest
@testable import Lodestar

final class HomeViewModelTests: XCTestCase {

  func testInitialStateIsIdle() {
      let sut = makeSUT()

      XCTAssertEqual(sut.state.value, .idle)
  }

  func testOnViewDidLoadEndsInLoadedState() {
      let sut = makeSUT()

      sut.onViewDidLoad()

      XCTAssertEqual(sut.state.value, .loaded)
  }

  func testOnViewDidLoadNotifiesObserver() {
      let sut = makeSUT()
      var receivedStates: [ViewState] = []

      sut.state.bind { state in 
          receivedStates.append(state)
      }

      sut.onViewDidLoad()

      XCTAssertEqual(
          receivedStates,
          [.idle, .loading, .loaded]
      )
  }

  // MARK: - Helpers

  private func makeSUT() -> HomeViewModel {
      HomeViewModel(
          healthDataService: MockHealthDataService()
      )
  }
}
