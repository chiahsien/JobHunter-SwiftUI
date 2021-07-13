//
//  JobListViewModel.swift
//  JobHunter
//
//  Created by Nelson on 2020/11/23.
//

import Foundation
import Combine

final class JobListViewModel: ObservableObject {
    @Published var jobs: [Job] = []
    @Published var error: CustomError? = nil
    @Published var isFetchingJobs: Bool = false
    let sourceName: String

    private var cancellables = Set<AnyCancellable>()
    private let fetcher: Fetcher
    private var page: UInt = 0

    init(fetcher: Fetcher) {
        self.fetcher = fetcher
        sourceName = fetcher.name
    }

    func fetchJobs() {
        fetchJobs(at: 1)
    }

    func fetchMoreJobs() {
        fetchJobs(at: page + 1)
    }

    private func fetchJobs(at page: UInt) {
        guard !isFetchingJobs else { return }

        error = nil
        isFetchingJobs = true

        fetcher.fetchJobs(at: page)
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] completion in
                if case .failure(let error) = completion {
                    self.error = error
                }
                self.isFetchingJobs = false
            } receiveValue: { [unowned self] jobs in
                self.jobs.append(contentsOf: jobs)
                self.page = page
            }
            .store(in: &cancellables)
    }
}
