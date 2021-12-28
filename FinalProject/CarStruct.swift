import UIKit
class CarModel {
    var cars: Car
    var quantity: Int
    init(cars: Car, quantity: Int) {
        self.cars = cars
        self.quantity = quantity
    }
}
struct Car : Codable {
    let year : Int
    let id : Int
    let horsepower : Int
    let make : String
    let model : String
    let price : Int
    let img_url : String
}
