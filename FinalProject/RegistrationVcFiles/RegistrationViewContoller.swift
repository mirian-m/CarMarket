import UIKit
class RegistrationViewContoller: UIViewController {
    @IBOutlet weak var lbTitle: UILabel!{
        didSet {
            lbTitle.font = UIFont(name: "Helvetica Neue", size: 22)
            lbTitle.textColor = UIColor(displayP3Red: 0.27, green: 0.65, blue: 1.0, alpha: 1.0)
        }
    }
    @IBOutlet weak var eMail: UITextField!{
        didSet {
            eMail.layer.borderWidth = 2
            eMail.layer.cornerRadius = 16
        }
    }
    @IBOutlet weak var password: UITextField! {
        didSet {
            password.autocorrectionType = .no
            password.layer.borderWidth = 2
            password.layer.cornerRadius = 16
        }
    }
    @IBOutlet weak var enterBtn: UIButton! {
        didSet {
            enterBtn.setButtonDesign()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func emailTextFild(_ sender: UITextField) {
        if sender.text == "ელ-ფოსტა" {
            sender.text = ""
        }
    }
}

