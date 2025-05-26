//
//  NRDashboardArticleItemAPIModel.swift
//  NewsNectar
//
//  Created by Akhil Verma on 26/05/25.
//  Copyright © 2025 Odon Labs. All rights reserved.
//

import Foundation

struct NRDashboardArticleItemAPIModel: Codable {
    let url: String
    let author: String
    let content: String
    let publishedAt: String
    let urlToImage: String
    let title, description: String
    let source: NRDashboardArticleSourceAPIModel
}
