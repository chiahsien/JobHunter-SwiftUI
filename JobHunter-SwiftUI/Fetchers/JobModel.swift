//
//  JobModel.swift
//  JobHunter-SwiftUI
//
//  Created by Nelson on 2021/7/11.
//

import Foundation

struct Job: Identifiable {
    var id: String { url.absoluteString }

    let title: String
    let company: String
    let url: URL
    var salary: String?
    var logo: URL?
    var location: String?
    var tags: [String]?
}
