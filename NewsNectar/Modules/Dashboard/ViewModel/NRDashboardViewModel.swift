//
//  NRDashboardViewModel.swift
//  NewsNectar
//
//  Created by Akhil Verma on 26/05/25.
//  Copyright © 2025 Odon Labs. All rights reserved.
//

import Foundation

class NRDashboardViewModel: ObservableObject {
    private let navigationTitle = "Dashboard"
    var articles: NRDashboardArticleAPIModel?
    private let fetchNewsUseCase: NRDashboardFetchNewsUseCase

    init(_ fetchNewsUseCase: NRDashboardFetchNewsUseCase = NRDefaultDashboardFetchNewsUseCase()) {
        self.fetchNewsUseCase = fetchNewsUseCase
    }

    @MainActor
    func viewDidLoad() async {
        do {
            articles = try await fetchNewsUseCase.execute()
            objectWillChange.send()
        } catch {
            debugPrint(error)
        }
    }

    func getNavigationTitle() -> String {
        navigationTitle
    }
}

private extension NRDashboardViewModel {
    
}
