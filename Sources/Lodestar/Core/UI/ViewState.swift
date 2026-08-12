enum ViewState {
  case idle
  case loading
  case loaded
  case empty
  case error(Error)
}
