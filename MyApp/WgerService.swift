//
//  WgerService.swift
//  MyApp
//
//  Created by Ryann Stock on 11/6/26.
//

import Foundation

struct WgerService{
    static func searchExercises(term: String) async throws -> [WgerExercise]{
        
        var url = URL(string: "https://wger.de/api/v2/exerciseinfo/")!
        url.append(queryItems: [
            URLQueryItem(name: "name__search", value: term),
            URLQueryItem(name: "language__code", value: "en"),
            URLQueryItem(name: "limit", value: "20")
        ])
        
        let (data,_) = try await URLSession.shared.data(from:url)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(WgerResponse.self, from: data)
        
        return response.results
    }
}
