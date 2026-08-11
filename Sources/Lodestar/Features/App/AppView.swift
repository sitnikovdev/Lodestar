import ComposableArchitecture
import SwiftUI

struct AppView: View {

    let store: StoreOf<AppFeature>

    var body: some View {
        Text(store.title)
            .font(.largeTitle)
            .onAppear {
                store.send(.onAppear)
            }
    }
}

#Preview {
    AppView(
        store: Store(initialState: AppFeature.State()) {
            AppFeature()
        }
    )
}
