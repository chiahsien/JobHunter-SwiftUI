//
//  ContentView.swift
//  JobHunter-SwiftUI
//
//  Created by Nelson on 2021/7/10.
//

import SwiftUI

struct ContentView: View {
    let fetchers: [String] = ["meet.jobs", "CakeResume", "Yourator"]

    var body: some View {
        JobListView(fetchers: fetchers)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
