enum NetworkError: Error {
    case invalidURL, networkError(Error), serializationError, invalidResponse, invalidData
}

class NetworkManager {
    static let shared = NetworkManager()

    private let baseURL = "http://127.0.0.1:8000"

    private init() { print("NetworkManager called ") }

    func getData(id: Int, success: @escaping ([String: Any]) -> Void, failure: @escaping (NetworkError) -> Void) {
        print("get data")
        let urlString = baseURL + "/get/\(id)"
        guard let url = URL(string: urlString) else {
            failure(.invalidURL)
            return
        }

        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in
            print("session started")
            if let error = error {
                failure(.networkError(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200 ... 299).contains(httpResponse.statusCode)
            else {
                failure(.invalidResponse)
                return
            }

            guard let data = data,
                  let responseData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            else {
                failure(.invalidData)
                return
            }
            print("session ended")
            print(responseData)
            success(responseData)
        }

        task.resume()
    }

    func postData(id: Int, data: [String: Any], success: @escaping (String) -> Void, failure: @escaping (NetworkError) -> Void) {
        let urlString = baseURL + "/post/\(id)"
        guard let url = URL(string: urlString) else {
            failure(.invalidURL)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            failure(.serializationError)
            return
        }

        let session = URLSession.shared

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                failure(.networkError(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200 ... 299).contains(httpResponse.statusCode)
            else {
                failure(.invalidResponse)
                return
            }

            guard let data = data,
                  let responseData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            else {
                failure(.invalidData)
                return
            }

            if let status = responseData["status"] as? String {
                success(status)
            } else {
                failure(.invalidData)
            }
        }

        task.resume()
    }
}
