//
//  WebService.swift
//  HaberProjesi
//
//  Created by Semih Mac on 1.01.2023.
//

import Foundation

class WebService {
    
    func getNews(url:URL,completion : @escaping ([News]?) -> ()){
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                let newsArray = try? JSONDecoder().decode([News].self, from: data)
                if let newsArray = newsArray {
                    completion(newsArray)
                }
            }
        }.resume()
        
    }
}
