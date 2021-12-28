import UIKit
class Balance  {
    var myBalance: Int
    init() {
        myBalance = Int.random(in: 0...Int(UInt16.max))
    }
    func filUupBalance() -> Int {
        return Int.random(in: myBalance...Int(UInt32.max))
         
    }
    func setNewBalance(expense: Int) ->Int {
        return myBalance > expense ? (myBalance - expense) : myBalance
    }
}
