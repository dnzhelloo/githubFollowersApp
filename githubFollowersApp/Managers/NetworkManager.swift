//
//  NetworkManager.swift
//  githubFollowersApp
//
//  Created by deniz on 27.03.2023.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/"
    
    private init (){}
    
    func getFollowers(for username:String,page:Int, completed:@escaping([Follower]?,String?)->Void){
        let endpoint =  baseURL + "users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil,"the username dosen't found it ")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil,"unable to complete your request.please check your internet connection")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil,"the response went wrong")
                return
            }
            
            guard let data = data else {
                completed(nil,"The data recived from the server was invalid.Please try again")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers,nil)
                
            } catch  {
                completed(nil,"The data recived from the server was invalid.Please try again")
            }
            
        }
        task.resume()
    }
}
