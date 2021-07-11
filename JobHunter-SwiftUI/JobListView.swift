//
//  JobListView.swift
//  JobHunter-SwiftUI
//
//  Created by Nelson on 2021/7/10.
//

import SwiftUI

struct JobListView: View {
    let sources: [Fetcher]
    var body: some View {
        NavigationView {
            List(sources, id: \.name, rowContent: { source in
                Text(source.name)
                    .font(.title)
                    .frame(height: 60.0)
            })
            .navigationTitle("Job Hunter")
        }
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        let fetchers: [Fetcher] = [MeetJobsFetcher(), CakeResumeFetcher(), YouratorFetcher()]
        JobListView(sources: fetchers)
    }
}
