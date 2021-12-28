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
    func navigate(navControler: UINavigationController, isSucsses: Bool){
        self.modalPresentationStyle = .fullScreen
        navControler.present(self, animated: true, completion: nil)
        
        self.isSucsses = isSucsses
    }
    @IBAction func getBackBtAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
