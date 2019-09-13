import Foundation

class UDForForecast {
    static let shared = UDForForecast()
    
    private let descriptionArrayID = "UDForCurrent.descriptionArrayID"
    
    var descriptionArrayUD: [String]? {
        set { UserDefaults.standard.set(newValue, forKey: descriptionArrayID) }
        get { return UserDefaults.standard.array(forKey: descriptionArrayID) as? [String] }
    }
    
    private let timeArrayID = "UDForCurrent.timeArrayID"
    
    var timeArrayUD: [String]? {
        set { UserDefaults.standard.set(newValue, forKey: timeArrayID) }
        get { return UserDefaults.standard.array(forKey: timeArrayID) as? [String] }
    }
    
    private let tempArrayID = "UDForCurrent.tempArrayID"
    
    var tempArrayUD: [Int]? {
        set { UserDefaults.standard.set(newValue, forKey: tempArrayID) }
        get { return UserDefaults.standard.array(forKey: tempArrayID) as? [Int] }
    }
    
    private let imageArrayID = "UDForCurrent.imageArrayID"
    
    var imageArrayUD: [String]? {
        set { UserDefaults.standard.set(newValue, forKey: imageArrayID) }
        get { return UserDefaults.standard.array(forKey: imageArrayID) as? [String] }
    }
}
