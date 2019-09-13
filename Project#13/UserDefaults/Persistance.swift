import Foundation

class Persistnace {
    static let shared = Persistnace()
    
    private let kFirstNameKey = "Persistnace.kFirstNameKey"
    
    var firstName: String? {
        set { UserDefaults.standard.set(newValue, forKey: kFirstNameKey) }
        get { return UserDefaults.standard.string(forKey: kFirstNameKey) }
    }
    
    private let kSecondNameKey = "Persistnace.kSecondNameKey"
    
    var secondName: String? {
        set { UserDefaults.standard.set(newValue, forKey: kSecondNameKey) }
        get { return UserDefaults.standard.string(forKey: kSecondNameKey) }
    }
}
