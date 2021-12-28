import UIKit

class CarModelTableViewCell: UITableViewCell {
    @IBOutlet weak var carModelCell: CarModelTableViewCell!
    
    @IBOutlet weak var view: UIView! {
        didSet {
            view.setViewDesign()
        }
    }
    @IBOutlet weak var modelIconImg: UIImageView!
    
    @IBOutlet weak var modelNameLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

