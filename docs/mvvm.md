# MVVM

Lodestar uses a lightweight MVVM architecture.


ViewControllers are responsible for:
- UIKit view hierarchy
- layout
- user interaction
- rendering ViewModel state

ViewModels are responsible for:
- screen state
- lifecycle events
- business/use-case orchestration


## Binding

ViewModel -> View binding uses a lightweigth closure-based `Observable`

Example:

```swift
viewModel.state.bind { [weak self] state in
    self?.render(state: state)
}
```


