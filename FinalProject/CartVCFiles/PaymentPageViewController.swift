import UIKit
class PaymentPageViewController: UIViewController {
    var selectedCars: [CarModel]!
    var carMakerStr: [String]!
    var dictionaryOfCars = [Int:[CarModel]]()
    var balanceAccount = Balance()
    var comission: Int {
        get {
            return  (totalCost + 50) * 10 / 100
        }
    }
    var totalCost: Int {
        get {
            var sum = 0
            for item in selectedCars {
                sum += item.quantity * item.cars.price
            }
            return sum
        }
    }
    @IBOutlet weak var balaceView: UIView! {
        didSet {
            balaceView.setViewDesign()
        }
    }
    @IBOutlet weak var btForFillBalance: UIButton!
    @IBOutlet weak var balaceIcon: UIImageView! {
        didSet {
            balaceIcon.setImgViewDesign()
        }
    }
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var totalPriceLB: UILabel!{
        didSet {
            let totalPrice = totalCost + 50
            totalPriceLB.text = "\(totalPrice)$"
        }
    }
    @IBOutlet weak var comissionLb: UILabel! {
        didSet {
            comissionLb.text = "\(self.comission)$"
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
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        balanceAccount.myBalance = balanceAccount.setNewBalance(expense: totalCost)
        self.myBalanceLb.text = "\(balanceAccount.myBalance)"
        
    }
}
