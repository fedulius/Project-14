import Foundation

struct Value: Decodable {
    let name: String
    let weather: [Description]
    let main: Temp
    let dt: Int
}

struct Description: Decodable {
    let description: String
    let icon: String
}

struct Temp: Decodable {
    let temp: Double
}

class methodOfPars {
    
    func parsingAndRead(completition: @escaping (Value) -> Void) {
        let jsonUrl = "https://api.openweathermap.org/data/2.5/weather?id=524901&appid=10ba0d49e7005cc5c725c5f72c90accc&units=metric&lang=ru"
    
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            if err != nil { return }
            do {
                let course = try JSONDecoder().decode(Value.self, from: data)
                DispatchQueue.main.async {
                    completition(course)
                }
            } catch { print(err) }
        }.resume()
    }
}
