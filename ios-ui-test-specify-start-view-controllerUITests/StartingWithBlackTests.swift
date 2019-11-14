import XCTest

class StartingWithBlackTests: XCTestCase {

    func testShouldStartWithBlackStory() {
        let app = XCUIApplication()
        app.launchEnvironment = ["startWithStoryboardName": "StoryBlack"]
        app.launch()

        XCTAssertTrue(app.otherElements["viewWithBlackBackground"].waitForExistence(timeout: 3))
        XCTAssertFalse(app.otherElements["viewWithRedBackground"].exists)
    }
}
