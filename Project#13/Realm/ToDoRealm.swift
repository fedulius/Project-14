import Foundation
import RealmSwift

@objcMembers class toDoPersistance: Object {
    dynamic var name = ""
}

class editValue: ToDoViewController {
    
    static let toDoRealm = editValue()
    
    let realm = try! Realm()
    
    func addValue(newValue: String?) {
        if newValue != nil{
            let first = toDoPersistance()
            first.name = newValue!
            try! realm.write {
                realm.add(first)
            }
        }
    }
    
    func deleteValue(object: Object) {
        
        try! realm.write {
            realm.delete(object)
        }
    }
}
