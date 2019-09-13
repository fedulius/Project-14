import UIKit

class ViewControllerForTable: UIViewController {
    
    @IBOutlet weak var forecastTable: UITableView!
    
    let del = tablePars()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        saveInUD()
        forecastTable.reloadData()
    }
    
    func saveInUD() {
        var description: [String] = []
        var time: [String] = []
        var temp: [Int] = []
        var image: [String] = []
        del.parsAndFil{ check in
            var count = 0
            while count < check.list.count{
                description.append(check.list[count].weather[0].description)
                time.append(check.list[count].dt_txt)
                temp.append(Int(check.list[count].main.temp))
                image.append(check.list[count].weather[0].icon)
                count += 1
            }
            UDForForecast.shared.descriptionArrayUD = description
            UDForForecast.shared.timeArrayUD = time
            UDForForecast.shared.tempArrayUD = temp
            UDForForecast.shared.imageArrayUD = image
        }
    }
}

extension ViewControllerForTable: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as! TableViewCell
        del.parsAndFil{ smth in
            cell.descriptionLabel.text = UDForForecast.shared.descriptionArrayUD![indexPath.row]
            cell.explainImage.image = UIImage(named: UDForForecast.shared.imageArrayUD![indexPath.row])
            cell.tempTableLabel.text = "\(UDForForecast.shared.tempArrayUD![indexPath.row])"
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "dd.MM HH:mm"
            cell.timeTableLabel.text = UDForForecast.shared.timeArrayUD![indexPath.row]
        }
        return cell
    }
}
