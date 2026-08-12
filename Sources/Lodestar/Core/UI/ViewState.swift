enum ViewError: Equatable {
    case network
    case unauthorized
    case unknown
}

enum ViewState: Equatable {
    case idle
    case loading
    case loaded
    case empty
    case error(ViewError)
}
