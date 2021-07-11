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
        List {
            ForEach(viewModel.jobs, id: \.url) { job in
                JobItemView(job: job)
            }

            HStack {
                Spacer()
                ProgressView()
                    .padding(20.0)
                    .opacity(viewModel.isFetchingJobs ? 1 : 0)
                    .onAppear(perform: {
                        viewModel.fetchMoreJobs()
                    })
                Spacer()
            }
        }
        .navigationTitle(viewModel.sourceName)
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        JobListView(viewModel: JobListViewModel(fetcher: MeetJobsFetcher()))
    }
}
