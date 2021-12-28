import UIKit

class CarDataTableViewCell: UITableViewCell {
    
    weak var delegate : CarDataViewControllerDelegate!
    @IBOutlet weak var carDataCell: UIView!
    
    @IBOutlet weak var carView: UIView!{
        didSet {
            carView.setViewDesign()
        }
    }
    @IBOutlet weak var carImage: UIImageView!{
        didSet {
            carImage.setImgViewDesign()
        }
    }
    @IBOutlet weak var carNameLb: UILabel!
    @IBOutlet weak var horsePowerLb: UILabel!
    @IBOutlet weak var quantityLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    @IBAction func minusBt(_ sender: UIButton) {
        delegate.removeCar(cell: self)
    }

    @IBAction func plusBtn(_ sender: UIButton) {
        delegate.addCar(cell: self)
    }
}
