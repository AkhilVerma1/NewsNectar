//
//  NRDashboardFetchNewsRepository.swift
//  NewsNectar
//
//  Created by Akhil Verma on 26/05/25.
//  Copyright © 2025 Odon Labs. All rights reserved.
//

import Foundation

protocol NRDashboardFetchNewsRepository {
    func fetchNews() async throws -> NRDashboardArticleAPIModel
}
