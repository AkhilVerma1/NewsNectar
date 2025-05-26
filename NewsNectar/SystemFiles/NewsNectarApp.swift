//
//  NewsNectarApp.swift
//  NewsNectar
//
//  Created by Akhil Verma on 26/05/25.
//

import SwiftUI

@main
struct NewsNectarApp: App {
    var body: some Scene {
        WindowGroup {
            NRDashboardView(viewModel: .init())
        }
    }
}
