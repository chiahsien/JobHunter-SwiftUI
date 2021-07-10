//
//  JobListView.swift
//  JobHunter-SwiftUI
//
//  Created by Nelson on 2021/7/10.
//

import SwiftUI

struct JobListView: View {
    let fetchers: [String]
    var body: some View {
        NavigationView {
            List(fetchers, id: \.self, rowContent: { fetcher in
                Text(fetcher)
                    .font(.title)
                    .frame(height: 60.0)
            })
            .navigationTitle("Job Hunter")
        }
    }
}

struct JobItemView_Previews: PreviewProvider {
    static var previews: some View {
        let fetchers: [String] = ["meet.jobs", "CakeResume", "Yourator"]
        JobListView(fetchers: fetchers)
    }
}
