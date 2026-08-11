import ComposableArchitecture

@Reducer 
struct AppFeature {

  @ObservableState
  struct State: Equatable {
    var title = "Lodestar"
  }

  enum Action {
      case onAppear
  }

  var body: some ReducerOf<Self> {
      Reduce { state, action in 
          switch action {
          case .onAppear:
              return .none
          }
      }
  }
}
