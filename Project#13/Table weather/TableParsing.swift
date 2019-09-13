import Foundation
import Alamofire

struct Filling: Decodable {
    let list: [ValueContent]
}

struct ValueContent: Decodable{
    let main: TableTemp
    let weather: [TableDescription]
    let dt_txt: String
}

struct TableTemp: Decodable{
    let temp: Double
}

struct TableDescription: Decodable{
    let description: String
    let icon: String
}

class tablePars {
    func parsAndFil(completition: @escaping (Filling) -> (Void)) {
        Alamofire.request("https://api.openweathermap.org/data/2.5/forecast?id=524901&appid=10ba0d49e7005cc5c725c5f72c90accc&units=metric&lang=ru").responseJSON
            { responce in
                if let data = responce.data {
                    do {
                        let smth = try JSONDecoder().decode(Filling.self, from: data)
                        DispatchQueue.main.async { completition(smth) }
                    } catch {}
                }
        }
    }
}
