import UIKit
class CarMakeVC: UIViewController {
    var carsArray = [CarModel]()
    var carMake = Set<String>()
    var selectedCarQuantity: Int {
        get {
            var s = 0
            for item in carsArray {
                s += item.quantity
            }
            return s
        }
    }
    var totalPrice: Int {
        get {
            var s = 0
            for item in carsArray {
                s += item.quantity * item.cars.price
            }
            return s
        }
    }
    @IBOutlet weak var totalSelected: UILabel!
    @IBOutlet weak var totalCostLb: UILabel!
    @IBOutlet weak var carMOdelTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromWeb()
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.totalSelected.text = "\(selectedCarQuantity)x"
        self.totalCostLb.text = "\(totalPrice)$"
    }
}

