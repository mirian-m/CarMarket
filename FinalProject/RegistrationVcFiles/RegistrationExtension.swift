import UIKit
extension RegistrationViewContoller {
    @IBAction func enterBtnAction(_ sender: UIButton) {
        if !isValidEmail(email: eMail.text) {
            emeilAlert()
        }
        if !isValidPassword(password: password.text) {
            passwordAlert()
        }
        if  let vc = self.storyboard?.instantiateViewController(withIdentifier: "CarModelVC") as? CarModelVC {
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func isValidEmail(email: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword (password: String?)-> Bool {
        return (password != nil && password!.count > 0)
    }
    
    func emeilAlert (){
        let alert = UIAlertController(title: "Alert", message: "გთხოვთ შეიყვანოთ სწორი მეილი", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func passwordAlert (){
        let alert = UIAlertController(title: "Alert", message: "გთხოვთ შეიყვანოთ პაროლი", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
