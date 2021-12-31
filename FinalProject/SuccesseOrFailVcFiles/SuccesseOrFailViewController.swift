import UIKit
class SuccesseOrFailViewController: UIViewController {
    private var isSucsses: Bool!
    @IBOutlet weak var okFailImg: UIImageView!
    @IBOutlet weak var textLb: UILabel!
    @IBOutlet weak var getBackBt: UIButton!{
        didSet {
            getBackBt.setButtonDesign()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isSucsses {
            self.textLb.text = "გადახდა წარმატებით შესრულდა"
            self.okFailImg.image = UIImage(named: "ok_icon")
        } else {
            self.textLb.text = "სამწუხაროდ გადახდა ვერ მოხერდხა,\n სცადეთ თავიდან"
            self.okFailImg.image = UIImage(named: "error_icon")
        }
    }
    
    @IBAction func getBackBtAction(_ sender: UIButton) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CarMakeVC") as! CarMakeVC
            self.navigationController?.pushViewController(vc, animated: true)
            self.dismiss(animated: true, completion: nil)
    }
    
    func navigate(navControler: UINavigationController, isSucsses: Bool){
        if isSucsses {
            navControler.pushViewController(self, animated: true)
        } else {
            navControler.present(self, animated: true, completion: nil)
        }
        self.isSucsses = isSucsses
    }
}
