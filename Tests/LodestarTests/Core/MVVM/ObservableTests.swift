import XCTest
@testable import Lodestar

final class ObservableTests: XCTestCase {

    func testBindImmediatelyReceivesCurrentValue() {
        let observable = Observable<Int>(42)
        var receivedValue: Int?

        observable.bind { value in
            receivedValue = value
        }

        XCTAssertEqual(receivedValue, 42)
    }

    func testObserverReceivesNewValue() {
        let observable = Observable<Int>(0)
        var receivedValues: [Int] = []

        observable.bind { value in
            receivedValues.append(value)
        }

        observable.value = 1
        observable.value = 2

        XCTAssertEqual(receivedValues, [0, 1, 2])
    }

    func testBindReplacesPreviousObserver() {
        let observable = Observable<Int>(0)

        var firstObserverValue:[Int] = []
        var secondObserverValues: [Int] = []

        observable.bind {value in
            firstObserverValue.append(value)
        }

        observable.bind { value in
            secondObserverValues.append(value)
        }

        observable.value = 1

        XCTAssertEqual(firstObserverValue, [0])
        XCTAssertEqual(secondObserverValues, [0, 1])

    }

}
