import UIKit
extension CarDataViewController: UITableViewDelegate, UITableViewDataSource,CarDataViewControllerDelegate {
    @IBAction func sortBnAction(_ sender: UIButton) {
        sortArrayBy(sender: sender)
        setPressedBtnColor(sender: sender)
        carDataTableView.reloadData()
        
    }
    
    func setPressedBtnColor(sender: UIButton) {
        if pressedButton == nil {
            pressedButton = sender
            sender.setButtonDesign()
        } else {
            pressedButton.backgroundColor = .init(red: 0.96, green: 0.96, blue: 0.98, alpha: 1)
            pressedButton.setTitleColor(.init(red: 0.14, green: 0.12, blue: 0.13, alpha: 1.0), for: .normal)
            sender.setButtonDesign()
            pressedButton = sender
        }
    }
    
    func sortArrayBy(sender: UIButton){
        switch sender.tag {
        case 0:
            selectedCarArray.sort(by: {$0.cars.price < $1.cars.price})
        case 1:
            selectedCarArray.sort(by: {$0.cars.price > $1.cars.price})
        case 2:
            selectedCarArray.sort(by: {$0.cars.model > $1.cars.model})
        case 3:
            selectedCarArray.sort(by: {$0.cars.model < $1.cars.model})
        default:
            return
        }
    }

    func removeCar(cell: CarDataTableViewCell) {
        guard let index = self.carDataTableView.indexPath(for: cell) else {return}
        if  selectedCarArray[index.row].quantity > 0 {
            selectedCarArray[index.row].quantity -= 1
        }
        carDataTableView.reloadData()
    }
    func addCar(cell: CarDataTableViewCell) {
        guard let index = self.carDataTableView.indexPath(for: cell) else {return}
        selectedCarArray[index.row].quantity += 1
        carDataTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedCarArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarDataTableViewCell", for: indexPath) as! CarDataTableViewCell
        let car = selectedCarArray[indexPath.row]
        cell.selectionStyle = .none
        cell.carNameLb.text = car.cars.model.capitalizingFirstLetter()
        cell.carImage.imgFromServerURL(urlString: car.cars.img_url)
        cell.horsePowerLb.text = "\(car.cars.horsepower)"
        cell.quantityLb.text = "\(car.quantity)"
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
}
