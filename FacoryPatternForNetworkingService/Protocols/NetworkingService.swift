//
//  NetworkingService.swift
//  FacoryPatternForNetworkingService
//
//  Created by Michelle Grover on 3/5/23.
//

import Foundation

protocol NetworkingService {
    func fetchAcronyms(for searchTerm: String, completion: @escaping (Result<AcronymObject, Error>) -> Void)
}
