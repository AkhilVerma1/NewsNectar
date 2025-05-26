//
//  NRDashboardArticleAPIModel.swift
//  NewsNectar
//
//  Created by Akhil Verma on 26/05/25.
//  Copyright © 2025 Odon Labs. All rights reserved.
//

import Foundation

struct NRDashboardArticleAPIModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [NRDashboardArticleItemAPIModel]
}
