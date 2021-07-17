
import XCTest
import Dispatch
@testable import GCD

class GCDTests: XCTestCase {

   
    func testGCD(){
        
        DispatchQueue.main.async {
            print("DispatchQueue.main.async")
        }
        for i in 0...5 {
            DispatchQueue.global().sync {
                print("DispatchQueue.global.sync \(i)")
                
                DispatchQueue.main.async {
                        print("DispatchQueue.main.async \(i)")
                }
            }
        }
        
        print("hola")
        
    }

}
