//
//  JobListView.swift
//  JobHunter-SwiftUI
//
//  Created by Nelson on 2021/7/11.
//

import SwiftUI

struct JobListView: View {
    @StateObject var viewModel: JobListViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.jobs, id: \.url) { job in
                    JobItemView(job: job)
                }
            }
            .navigationTitle(viewModel.sourceName)
        }
        .onAppear(perform: {
            viewModel.fetchJobs()
        })
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        JobListView(viewModel: JobListViewModel(fetcher: MeetJobsFetcher()))
    }
}
