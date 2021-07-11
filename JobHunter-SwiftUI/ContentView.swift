//
//  ContentView.swift
//  JobHunter-SwiftUI
//
//  Created by Nelson on 2021/7/10.
//

import SwiftUI

struct ContentView: View {
    let fetchers: [Fetcher] = [MeetJobsFetcher(), CakeResumeFetcher(), YouratorFetcher()]

    var body: some View {
        JobListView(sources: fetchers)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
