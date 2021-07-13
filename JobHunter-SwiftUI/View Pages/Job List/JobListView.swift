//
//  JobListView.swift
//  JobHunter-SwiftUI
//
//  Created by Nelson on 2021/7/11.
//

import SwiftUI

struct JobListView: View {
    @StateObject var viewModel: JobListViewModel
    @State private var selectedJob: Job?
    
    var body: some View {
        List {
            ForEach(viewModel.jobs) { job in
                Button(action: { self.selectedJob = job }, label: {
                    JobItemView(job: job)
                        .padding(.vertical, 8.0)
                })
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
        .sheet(item: $selectedJob, content: { job in
            JobWebPageView(url: job.url)
        })
        .navigationTitle(viewModel.sourceName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        JobListView(viewModel: JobListViewModel(fetcher: MeetJobsFetcher()))
    }
}
