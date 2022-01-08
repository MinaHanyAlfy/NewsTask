//
//  Network.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-08.
//

import Foundation
class NetworkLayer {
    
    static let shared = NetworkLayer()
    

    func getResults<M: Codable>(APICase: API,decodingModel: M.Type, completed: @escaping (Result<M,ErorrMessage> ) -> Void) {
     
        var request : URLRequest = APICase.request
       
        request.httpMethod = APICase.method.rawValue
        request.addValue("8e5161eb2e744e4ab03c255267d94f75", forHTTPHeaderField: "X-Api-Key")
        
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error =  error {
                completed((.failure(.InvalidData)))
            }
            guard let data = data else {
                completed((.failure(.InvalidData)))
                return
            }
            guard let response =  response  as? HTTPURLResponse ,response.statusCode == 200 else{
                completed((.failure(.InvalidResponse)))
                return
            }
            let decoder = JSONDecoder()
            do
            {
               
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(M.self, from: data)
                print(results)
                completed((.success(results)))
                
            }catch {
                print(error)
                completed((.failure(.InvalidData)))
            }
            
        }
        task.resume()
    }
    
}
