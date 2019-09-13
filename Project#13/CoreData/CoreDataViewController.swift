import UIKit
import CoreData

class CoreDataViewController: UIViewController {

    @IBOutlet weak var coreTable: UITableView!
    
    var named = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func addValueInCore(_ sender: Any) {
        let alert = UIAlertController(title: "Новая задача", message: "Заполните поле", preferredStyle: .alert)
        
        var alertTextField: UITextField!
        alert.addTextField { textField in
            alertTextField = textField
            textField.placeholder = "Новая задача"
        }
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { (action) in
            guard let text = alertTextField.text , !text.isEmpty else { return }
            self.addInCore(name: text)
            self.coreTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func addInCore(name: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let persons = Todo(entity: Todo.entity(), insertInto: context)
        
        persons.setValue(name, forKey: "name")
        
        do {
            try context.save()
            named.append(persons)
        } catch { return }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            let result = try context.fetch(Todo.fetchRequest())
            named = result as! [Todo]
        } catch { return }
    }
}

extension CoreDataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return named.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coreDataID") as! CoreDataTableViewCell
        let names = named[indexPath.row]
        
        cell.coreDataLabel.text = names.value(forKey: "name") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            context.delete(named[indexPath.row])
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                named = try context.fetch(Todo.fetchRequest())
            } catch { return }
            tableView.reloadData()
        }
    }
}
