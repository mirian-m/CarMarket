import UIKit
class PaymentPageViewController: UIViewController {
    var selectedCars: [CarModel]!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!{
        didSet {
            indicator.isHidden = true
        }
    }
    var carMakerStr: [String]!
    var dictionaryOfCars = [Int:[CarModel]]()
    var balanceAccount = Balance()
    var totalCost: Int {
        get {
            var sum = 0
            for item in selectedCars {
                sum += item.quantity * item.cars.price
            }
            return sum
        }
    }
    @IBOutlet weak var totalPriceLB: UILabel!{
        didSet {
            totalPriceLB.text = "\(totalCost + 50)$"
        }
    }
    @IBOutlet weak var comissionLb: UILabel! {
        didSet {
            comissionLb.text = "\(Double(totalCost) * 0.05)$"
        }
    }
    @IBOutlet weak var payBt: UIButton!{
        didSet {
            payBt.setButtonDesign()
        }
    }
    @IBOutlet weak var myBalanceLb: UILabel! {
        didSet {
            myBalanceLb.text = "\(balanceAccount.myBalance)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        carMakerStr = setCarMakerArr()
        fillDictionaryOfCars()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        balanceAccount.myBalance = balanceAccount.setNewBalance(expense: totalCost)
        self.myBalanceLb.text = "\(balanceAccount.myBalance)"
    }

}
//DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//    self.indicator.isHidden = false
////            indicator.isAnimating = true
//}
//
