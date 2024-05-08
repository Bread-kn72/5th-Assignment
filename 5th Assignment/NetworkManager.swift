//
//  NetworkManager.swift
//  5th Assignment
//
//  Created by Kinam on 5/7/24.
//

import Foundation

class NetworkManager {
    
    // MARK: - properties
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - methods
    func fetchBookList(query: String, completion: @escaping ([Document]) -> () ) {
        guard var url = URL(string: "https://dapi.kakao.com/v3/search/book") else { return }
        
        url.append(queryItems: [URLQueryItem(name: "query", value: query)])
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("KakaoAK d8006cbbd68cba700155976c858da5ae", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                print("에러 발생!!", error)
            }
            
            guard let data = data else { return }
            
            guard let bookResult = try? JSONDecoder().decode(Book.self, from: data) else {
                print("디코딩 실패")
                return
            }
            
            completion(bookResult.documents) // completion으로 escaping
            
        }.resume()
    }
}
