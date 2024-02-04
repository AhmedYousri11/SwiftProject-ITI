//
//  Network.swift
//  SwiftProject - Sports App
//
//  Created by JETSMobileLabMini9 on 30/01/2024.
//

import Foundation

//import Foundation
//import Alamofire
//
//class Service : ServiceProtocol {
//    
//    private let APIKey : String!
//    private let baseUrl:URL!
//    
//    static var instans = Service()
//   
//    private init(){
//        baseUrl  = URL(string:"https://apiv2.allsportsapi.com")
//        APIKey = "b145ab1293e571e3e658e1bf9592ee72b13c9ab09b385efba3b6aa3a8df39195"
//    }
//    
//    func fetchData<T: Decodable>(for sport : SportType, queryItems: [URLQueryItem], completionHandler: @escaping (Result<[T]?, Error>) -> Void) {
//        
//        var components = URLComponents(url: baseUrl.appendingPathComponent(sport.path), resolvingAgainstBaseURL: true)
//        components?.queryItems = queryItems
//        components?.queryItems?.append(URLQueryItem(name: "APIkey", value: APIKey))
//        
//        guard let url = components?.url else {
//            completionHandler(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
//            return
//        }
//        AF.request(url)
//            .validate()
//            .responseDecodable(of: T.self) { response in
//                switch response.result {
//                case .success(let value):
//                    completionHandler(.success(value.result))
//                case .failure(let error):
//                    completionHandler(.failure(error))
//                }
//            }
//        
//    }
//    
//    
//}


//25fc7c64551ae1db877251383c94f9765521699801442b593a22c704a306c95f

class NetworkManager{
    
    func fetchResult <T:Codable> (SportsUrl:String,type:T.Type,complitionHandler:@escaping (T?) -> Void){
        let url = URL(string: SportsUrl)
        
        guard let newURl = url else{
            complitionHandler (nil)
            return
        }
        
        let request = URLRequest(url: newURl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { Data, response, error in
//            print(Data)
//            print(response)
//            print(error)
            guard let newdata = Data else{
                complitionHandler(nil)
                return
            }
            do{
                let result = try JSONDecoder().decode(T.self, from: newdata)
                complitionHandler(result)
            }catch {
                complitionHandler(nil)
            }
        }
        task.resume()
    }
}
