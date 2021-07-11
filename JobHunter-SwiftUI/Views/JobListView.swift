//
//  JobListView.swift
//  JobHunter-SwiftUI
//
//  Created by Nelson on 2021/7/11.
//

import SwiftUI

struct JobListView: View {
    var jobs: [Job]

    var body: some View {
        List {
            ForEach(jobs, id: \.url) { job in
                JobItemView(job: job)
            }
        }
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        let jobs: [Job] = [
            Job(
                title: "iOS Engineer",
                company: "Apple",
                url: URL(string: "https://www.apple.com/1")!,
                salary: "100K/Annual",
                logo: nil,
                location: "Infinite Loop 1, Mountain View, CA",
                tags: ["Apple", "iOS", "Change the world", "Richest Company", "iPhone", "iPad"]
            ),
            Job(
                title: "Android Engineer",
                company: "Apple",
                url: URL(string: "https://www.apple.com/2")!,
                salary: "100K/Annual",
                logo: nil,
                location: "Infinite Loop 1, Mountain View, CA",
                tags: ["Apple", "iOS", "Change the world", "Richest Company", "iPhone", "iPad"]
            ),
            Job(
                title: "Mac Engineer",
                company: "Apple",
                url: URL(string: "https://www.apple.com/3")!,
                salary: "100K/Annual",
                logo: nil,
                location: "Infinite Loop 1, Mountain View, CA",
                tags: ["Apple", "iOS", "Change the world", "Richest Company", "iPhone", "iPad"]
            )
        ]

        JobListView(jobs: jobs)
    }
}
