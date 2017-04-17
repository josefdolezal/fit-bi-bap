import Foundation
import Quick
import Nimble

class CarSpec: QuickSpec {
    override func spec() {
        describe("a car") {
            var car = Car!
            beforeEach{ car = Car() }

            context("with empty fuel tank") {
                beforeEach{ car.engine.fuel = 0 }

                it("should not start") {
                    expect(car.canStart()).toNot(beTruthy())
                }
            }

            context("with full tank") {
                it("should start") {
                    car.engine.fuel = Tank.full
                    expect(car.canStart()).to(beTruthy())
                }
            }
        }
    }
}
