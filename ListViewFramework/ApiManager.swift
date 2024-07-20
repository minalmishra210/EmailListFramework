//
//  ApiManager.swift
//  EmailApiFramework
//
//  Created by Meenal Mishra on 02/07/24.
//

import Foundation
import Alamofire

public class APIManager {
    public static let shared = APIManager()
    
    private let baseUrl = "https://api.example.com" // Replace with your API base URL
    
    private init() { }
    
    public func getEmailAddresses(completion: @escaping (Result<[Dictionary<String, Any>], Error>) -> Void) {
        AF.request("https://dummy.restapiexample.com/api/v1/employees")
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(_):
                    if let jsonDict = response.value as? Dictionary<String,Any>, let empDetails = jsonDict["data"] as? [Dictionary<String,Any>] {
                        
                        completion(.success(empDetails))
                    } else {
                        completion(.failure(NSError(domain: "Parsing Error", code: 0, userInfo: nil)))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}


