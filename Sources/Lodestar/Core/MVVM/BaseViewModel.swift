import Foundation

class BaseViewModel {

    let state: Observable<ViewState>

    init(initialState: ViewState = .idle) {
        state = Observable(initialState)
    }

    func onViewDidLoad() {
        // Override in subclasses
    }

    func onAppear() {
        // Override in subclasses
    }

    func onDisappear() {
        // Override in subclasses
    }
}
