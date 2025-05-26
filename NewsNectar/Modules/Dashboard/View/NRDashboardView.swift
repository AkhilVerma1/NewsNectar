//
//  NRDashboardView.swift
//  NewsNectar
//
//  Created by Akhil Verma on 26/05/25.
//  Copyright © 2025 Odon Labs. All rights reserved.
//

import SwiftUI
import Kingfisher

struct NRDashboardView: View {
    @StateObject var viewModel: NRDashboardViewModel
    
    var body: some View {
        NavigationStack {
            List {
                if let articles = viewModel.articles {
                    Text("\(articles.totalResults)")
                    
                    ForEach(articles.articles, id: \.url) { article in
                        VStack {
                            Text(article.title)
                            Text(article.description)
                            Text(article.content)
                            
                            if let imageUrl = URL(string: article.urlToImage) {
                                KFImage(imageUrl)
                                    .placeholder {
                                        ProgressView()
                                    }
                                    .retry(maxCount: 3, interval: .seconds(2))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            }
                        }
                        .padding()
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.viewDidLoad()
                }
            }
            .navigationTitle(viewModel.getNavigationTitle())
        }
    }
}

#Preview {
    NRDashboardView(viewModel: .init())
}
