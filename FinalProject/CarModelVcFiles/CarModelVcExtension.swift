import UIKit
extension CarMakeVC :  UITableViewDelegate, UITableViewDataSource{

    @IBAction func moveToBag(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentPageViewController") as? PaymentPageViewController {
            vc.selectedCars = getItemsFromArrayByIdentifier(strIdentifier: nil, intIdentifier: 0)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func getDataFromWeb() {
        let JsonUrl = "https://private-anon-a41c950c16-carsapi1.apiary-mock.com/cars?fbclid=IwAR0wRAgw30gahMQTh1CZxZQf2lwSpp2VJRwsvDRDaxf_HGhMydrovMhgZV4"
        let url = URL(string: JsonUrl)
        URLSession.shared.dataTask(with: url!) {(data, _, _) in
            guard let data = data else{return}
            let result = try? JSONDecoder().decode([Car].self, from: data)
            if  result != nil {
                self.fillCarArrayFromJson(array: result!)
                DispatchQueue.main.async {
                    self.carMOdelTableView.reloadData()
                }
            }
        }.resume()
    }
    func fillCarArrayFromJson(array: [Car]) {
        for item in array {
            let car = CarModel(cars: item, quantity: 0)
            carsArray.append(car)
            carMake.insert(car.cars.make)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carMake.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarModelTableViewCell", for: indexPath) as! CarMakeTableViewCell
        cell.selectionStyle = .none
        let indexOfSet = carMake.index(carMake.startIndex, offsetBy: indexPath.row)
        cell.makeNameLb.text = carMake[indexOfSet].capitalizingFirstLetter()
        let logoUrl = ""
        cell.makeIconImg.imgFromServerURL(urlString: logoUrl.urlStringGenerator(str: carMake[indexOfSet]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: index!) as! CarMakeTableViewCell
        let carMake = currentCell.makeNameLb.text!.lowercasedFirstLetter()
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CarDataViewController") as? CarDataViewController {
            vc.selectedCarArray = getItemsFromArrayByIdentifier(strIdentifier: carMake)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func getItemsFromArrayByIdentifier (strIdentifier: String? = nil, intIdentifier: Int = -1) -> [CarModel] {
        var tempArray = [CarModel]()
        for item in carsArray {
            if (item.cars.make == strIdentifier || strIdentifier == nil), (item.quantity > intIdentifier) {
                tempArray.append(item)
            }
        }
        return tempArray
    }
}
