import UIKit

class ChoosenCarTableViewCell: UITableViewCell {

    @IBOutlet weak var choosenCarCell: ChoosenCarTableViewCell!
    
    @IBOutlet weak var carImage: UIImageView!{
        didSet {
            carImage.setImgViewDesign()
        }
    }
    @IBOutlet weak var quantutyLb: UILabel!
    @IBOutlet weak var modelLb: UILabel!
    @IBOutlet weak var totalCostLb: UILabel!
    @IBOutlet weak var horsPowerLb: UILabel!
    @IBOutlet weak var priceLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
