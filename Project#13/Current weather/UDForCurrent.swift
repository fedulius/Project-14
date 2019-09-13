import Foundation

class UDForCurrent {
    static let shared = UDForCurrent()
    
    private let cityNameID = "UDForCurrent.cityName"
    
    var cityName: String? {
        set { UserDefaults.standard.set(newValue, forKey: cityNameID) }
        get { return UserDefaults.standard.string(forKey: cityNameID) }
    }
    
    private let tempID = "UDForCurrent.tempID"
    
    var tempUD: String? {
        set { UserDefaults.standard.set(newValue, forKey: tempID) }
        get { return UserDefaults.standard.string(forKey: tempID) }
    }
    
    private let dataID = "UDForCurrent.tempDatalUD"
    
    var dateUD: String? {
        set { UserDefaults.standard.set(newValue, forKey: dataID) }
        get { return UserDefaults.standard.string(forKey: dataID) }
    }
    
    private let descriptionID = "UDForCurrent.descriptionID"
    
    var descriptionUD: String? {
        set { UserDefaults.standard.set(newValue, forKey: descriptionID) }
        get { return UserDefaults.standard.string(forKey: descriptionID) }
    }
    
    private let weatherImID = "UDForCurrent.weatherImID"
    
    var weatherImUD: String? {
        set { UserDefaults.standard.set(newValue, forKey: weatherImID) }
        get { return UserDefaults.standard.string(forKey: weatherImID) }
    }
}
