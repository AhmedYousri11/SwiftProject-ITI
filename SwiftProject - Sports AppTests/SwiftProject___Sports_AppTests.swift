//___FILEHEADER___

import XCTest
@testable import SwiftProject___Sports_App

final class ___FILEBASENAMEASIDENTIFIER___: XCTestCase {
    
    var networkManager : NetworkManager?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadDataShouldPass(){
        //let expectation = expectation(description: "Test API")
        networkManager = NetworkManager()
        networkManager?.fetchResult(SportsUrl: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=25fc7c64551ae1db877251383c94f9765521699801442b593a22c704a306c95f", type: GetLeagues.self, complitionHandler: { leagues in
            
            
            XCTAssertNotNil(leagues, "leagues are nil")
            
            //expectation.fulfill()
            
          
        }
        )
    }
    
}
