import XCTest

class StartingWithRedTests: XCTestCase {

    func testShouldStartWithRedStory() {
        let app = XCUIApplication()
        app.launchEnvironment = ["startWithStoryboardName": "StoryRed"]
        app.launch()

        XCTAssertTrue(app.otherElements["viewWithRedBackground"].waitForExistence(timeout: 3))
        XCTAssertFalse(app.otherElements["viewWithBlackBackground"].exists)
    }
}
