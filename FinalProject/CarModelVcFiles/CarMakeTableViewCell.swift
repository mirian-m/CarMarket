import UIKit

class CarMakeTableViewCell: UITableViewCell {
    @IBOutlet weak var carMakeCell: UIView!
    @IBOutlet weak var view: UIView! {
        didSet {
            view.setViewDesign()
        }
    }
    @IBOutlet weak var makeIconImg: UIImageView!
    @IBOutlet weak var makeNameLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

