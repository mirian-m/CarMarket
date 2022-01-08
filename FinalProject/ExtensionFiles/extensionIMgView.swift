import UIKit
extension UIImageView {
    func imgFromServerURL(urlString : String)  {
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
    func setImgViewDesign()  {
        self.layer.cornerRadius = 16
    }
}
extension UIButton {
    func setButtonDesign (){
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor(displayP3Red: 0.27, green: 0.65, blue: 1.0, alpha: 1.0)
        self.setTitleColor(.init(red: 0.97, green: 0.97, blue: 0.99, alpha: 1.0), for: .normal)
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension UIView {
    func setViewDesign() {
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor(red: 0.85, green: 0.86, blue: 0.91, alpha: 1.0).cgColor
        self.layer.cornerRadius = 16
    }
}
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    func lowercasedFirstLetter() -> String {
        return prefix(1).lowercased() + dropFirst()
    }
    func urlStringGenerator (str: String) -> String {
        let carLogoBaseUrl = "https://raw.githubusercontent.com/filippofilip95/car-logos-dataset/master/logos/thumb/"
        return "\(carLogoBaseUrl)\(str).png"
    }
}
