import UIKit
protocol CarDataViewControllerDelegate: class {
    func addCar(cell: CarDataTableViewCell)
    func removeCar(cell: CarDataTableViewCell)
}
class CarDataViewController: UIViewController {
    var selectedCarArray: [CarModel]!
    var pressedButton: UIButton!
    @IBOutlet weak var carDataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.title = selectedCarArray.first?.cars.make.capitalizingFirstLetter()

    }
}

