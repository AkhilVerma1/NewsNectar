//
//  NRDashboardView.swift
//  NewsNectar
//
//  Created by Akhil Verma on 26/05/25.
//  Copyright © 2025 Odon Labs. All rights reserved.
//

import SwiftUI

struct NRDashboardView: View {
    @StateObject var viewModel: NRDashboardViewModel

    var body: some View {
        NavigationStack {
            Text("Hello, World!")
                .navigationTitle(viewModel.getNavigationTitle())
        }
    }
}

#Preview {
    NRDashboardView(viewModel: .init())
}
