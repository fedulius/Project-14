import UIKit

class UserDefaultsViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var secondNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameField.text = Persistnace.shared.firstName
        secondNameField.text = Persistnace.shared.secondName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        Persistnace.shared.firstName = firstNameField.text
        Persistnace.shared.secondName = secondNameField.text
    }
}
