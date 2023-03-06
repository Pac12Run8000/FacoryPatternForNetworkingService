//
//  NetworkingService.swift
//  FacoryPatternForNetworkingService
//
//  Created by Michelle Grover on 3/5/23.
//

import Foundation

typealias NetworkingResult<T> = Result<T, Error>

protocol NetworkingService {
    func fetchAcronyms(for searchTerm: String, completion: @escaping (NetworkingResult<AcronymObject>) -> Void)
}
