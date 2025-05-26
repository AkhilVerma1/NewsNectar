//
//  NROnlineDashboardFetchNewsRepository.swift
//  NewsNectar
//
//  Created by Akhil Verma on 26/05/25.
//  Copyright © 2025 Odon Labs. All rights reserved.
//

import Foundation

class NROnlineDashboardFetchNewsRepository: NRDashboardFetchNewsRepository {
    private let router: NRRouter
    private let decoder = JSONDecoder()

    init(_ router: NRRouter = NRDefaultRouter()) {
        self.router = router
    }

    func fetchNews() async throws -> NRDashboardArticleAPIModel {
        let data = try await  router.request()
        return try decoder.decode(NRDashboardArticleAPIModel.self, from: data)
    }
}
