import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    func configurate(objects: toDoPersistance){
        taskLabel.text = objects.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

