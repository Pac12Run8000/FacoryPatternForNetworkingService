//
//  NetworkingServiceFactory.swift
//  FacoryPatternForNetworkingService
//
//  Created by Michelle Grover on 3/5/23.
//

import Foundation

class NetworkingServiceFactory {
    static func makeNetworkingService() -> NetworkingService {
        let session = URLSession.shared
        return AcronymNetworkingService(session: session)
    }
}
