import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tempTableLabel: UILabel!
    @IBOutlet weak var explainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeTableLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
