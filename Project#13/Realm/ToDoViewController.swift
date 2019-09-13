import UIKit
import RealmSwift

class ToDoViewController: UIViewController {

    @IBOutlet weak var MyTable: UITableView!
    
    var namesInRealm: [String] = []
    
    var object: Results<toDoPersistance>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = editValue.toDoRealm.realm
        object = realm.objects(toDoPersistance.self)
    }
    
    func addAlert() {
        let alert = UIAlertController(title: "Новая задача", message: "Заполните поле", preferredStyle: .alert)
        
        var alertTextField: UITextField!
        alert.addTextField { textField in
            alertTextField = textField
            textField.placeholder = "Новая задача"
        }
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { (action) in
            guard let text = alertTextField.text , !text.isEmpty else { return }
            editValue.toDoRealm.addValue(newValue: text)
            self.MyTable.insertRows(at: [IndexPath.init(row: self.object.count - 1, section: 0)], with: .automatic)
            self.MyTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func editButton(_ sender: Any) {
        addAlert()
    }
}

extension ToDoViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "realmCell") as! ToDoTableViewCell
        let objects = object[indexPath.row]
        cell.configurate(objects: objects)
        return cell
    }
    
    //delete
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let objects = object[indexPath.row]
            editValue.toDoRealm.deleteValue(object: objects)
            tableView.reloadData()
        }
    }
}
