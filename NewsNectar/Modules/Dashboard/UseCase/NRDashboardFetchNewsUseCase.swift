//
//  NRDashboardFetchNewsUseCase.swift
//  NewsNectar
//
//  Created by Akhil Verma on 26/05/25.
//  Copyright © 2025 Odon Labs. All rights reserved.
//

import Foundation

protocol NRDashboardFetchNewsUseCase {
    func execute() async throws -> NRDashboardArticleAPIModel
}

class NRDefaultDashboardFetchNewsUseCase: NRDashboardFetchNewsUseCase {
    private let repository: NRDashboardFetchNewsRepository

    init(_ repository: NRDashboardFetchNewsRepository = NROnlineDashboardFetchNewsRepository()) {
        self.repository = repository
    }

    func execute() async throws -> NRDashboardArticleAPIModel {
        try await repository.fetchNews()
    }
}

protocol NRRouter {
    func request() async throws -> Data
}

class NRDefaultRouter: NRRouter {

    func request() async throws -> Data {
        let newsUrl = "https://newsapi.org/v2/everything?q=apple&from=2025-05-25&to=2025-05-25&sortBy=popularity&apiKey=3489b0bc081d4327ac6fc158613a9ff5"
        guard let url = URL(string: newsUrl) else { throw NetworkError.invalidURL }
        let request = URLRequest(url: url)
        let data = try await URLSession.shared.data(for: request)
        return data.0
    }
}


enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
    case statusCode(Int)
}
