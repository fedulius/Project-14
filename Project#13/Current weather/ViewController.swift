import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var imageUnderButton: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = UDForCurrent.shared.cityName
        dateLabel.text = UDForCurrent.shared.dateUD
        tempLabel.text = UDForCurrent.shared.tempUD
        weatherImage.image = UIImage(named: UDForCurrent.shared.weatherImUD ?? "")
        descriptionLabel.text = UDForCurrent.shared.descriptionUD
    }
    
    override func viewDidAppear(_ animated: Bool) {
        methodOfPars().parsingAndRead { categores in
            self.cityLabel.text = categores.name
            UDForCurrent.shared.cityName = categores.name
            self.descriptionLabel.text = categores.weather[0].description
            UDForCurrent.shared.descriptionUD = self.descriptionLabel.text
            self.tempLabel.text = "\(Int(categores.main.temp)) Cº"
            UDForCurrent.shared.tempUD = self.tempLabel.text
            self.weatherImage.image = UIImage(named: categores.weather[0].icon)
            UDForCurrent.shared.weatherImUD = categores.weather[0].icon

            let date = DateFormatter()
            date.dateFormat = "dd.MM HH:mm"
            self.dateLabel.text = "\(date.string(from: Date(timeIntervalSince1970: TimeInterval(categores.dt))))"
            UDForCurrent.shared.dateUD = self.dateLabel.text
        }
        mainView.backgroundColor = UIColor(patternImage: (UIImage(named: "3")!))
    }
}
