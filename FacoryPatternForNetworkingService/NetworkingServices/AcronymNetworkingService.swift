//
//  NetworkingServiceFactory.swift
//  FacoryPatternForNetworkingService
//
//  Created by Michelle Grover on 3/5/23.
//

import Foundation


class AcronymNetworkingService: NetworkingService {
    private let baseURLString = "http://nactem.ac.uk/software/acromine/dictionary.py"
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func fetchAcronyms(for searchTerm: String, completion: @escaping (Result<AcronymObject, Error>) -> Void) {
        guard let url = makeURL(for: searchTerm) else {
            completion(.failure(NSError(domain: "NetworkingServiceErrorDomain", code: 1, userInfo: nil)))
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "NetworkingServiceErrorDomain", code: 1, userInfo: nil)))
                return
            }
            
            do {
                let acronyms = try JSONDecoder().decode(AcronymObject.self, from: data)
                completion(.success(acronyms))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    private func makeURL(for searchTerm: String) -> URL? {
        var components = URLComponents(string: baseURLString)!
        components.queryItems = [URLQueryItem(name: "sf", value: searchTerm)]
        return components.url
    }
}
