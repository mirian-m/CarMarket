import UIKit
extension PaymentPageViewController: UITableViewDelegate,UITableViewDataSource {
    @IBAction func payBtAction(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SuccesseOrFailViewController") as?
            SuccesseOrFailViewController {
            self.indicator.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
                self.indicator.stopAnimating()
                vc.navigate(navControler: self.navigationController!, isSucsses: balanceAccount.myBalance > totalCost)
            }
        }
    }
    @IBAction func topUpBalanceBtAction(_ sender: UIButton) {
        balanceAccount.myBalance = balanceAccount.filUupBalance()
        self.myBalanceLb.text = "\(balanceAccount.myBalance)"
    }
    func fillDictionaryOfCars () {
        for index in 0..<carMakerStr.count {
            dictionaryOfCars[index] = selectedCars.filter({$0.cars.make == carMakerStr[index]})
        }
    }
    func setCarMakerArr()-> [String] {
        var k = [String]()
        for item in selectedCars {
            if !k.contains(item.cars.make) {
                k.append(item.cars.make)
            }
        }
        return k
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCars.filter({$0.cars.make == carMakerStr[section]}).count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        carMakerStr.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hv = Bundle.main.loadNibNamed("HeaderView", owner: nil, options: nil)?.first as! HeaderView
        let logoUrl = ""
        hv.carLogoImg.imgFromServerURL(urlString: logoUrl.urlStringGenerator(str: carMakerStr[section]))
        hv.carMakerNameLb.text = carMakerStr[section].capitalizingFirstLetter()
        
        return hv
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoosenCarTableViewCell", for: indexPath) as! ChoosenCarTableViewCell
        cell.selectionStyle = .none
        let carsFromManufacturer = dictionaryOfCars[indexPath.section]
        let currentCar = carsFromManufacturer![indexPath.row]
        cell.quantutyLb.text = "\(currentCar.quantity)x"
        cell.carImage.imgFromServerURL(urlString: currentCar.cars.img_url)
        cell.horsPowerLb.text = "\(currentCar.cars.horsepower)"
        cell.priceLb.text = "\(currentCar.cars.price)$"
        cell.modelLb.text = currentCar.cars.model.capitalizingFirstLetter()
        cell.totalCostLb.text = "სულ: \(currentCar.cars.price * currentCar.quantity)$"
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}
