import UIKit
protocol CarDataViewControllerDelegate: class {
    func addCar(cell: CarDataTableViewCell)
    func removeCar(cell: CarDataTableViewCell)
}
class CarDataViewController: UIViewController {
    var selectedCarArray: [CarModel]!
    var pressedButton: UIButton!
    @IBOutlet weak var carDataTableView: UITableView!

    @IBOutlet weak var leadingConst: NSLayoutConstraint!
    @IBOutlet weak var trailingConst: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.title = selectedCarArray.first?.cars.make.capitalizingFirstLetter()
    }
}

