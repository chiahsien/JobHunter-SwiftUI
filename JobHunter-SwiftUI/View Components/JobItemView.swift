//
//  JobItemView.swift
//  JobHunter-SwiftUI
//
//  Created by Nelson on 2021/7/11.
//

import SwiftUI
import Kingfisher

struct JobItemView: View {
    var job: Job

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                KFImage(job.logo)
                    .placeholder {
                        Image(systemName: "building.2")
                            .font(.largeTitle)
                            .opacity(0.3)
                    }
                    .cancelOnDisappear(true)
                    .downsampling(size: CGSize(width: 50, height: 50))
                    .scaleFactor(UIScreen.main.scale)
                    .cacheOriginalImage()
                    .resizable()
                    .backgroundDecode()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50.0, height: 50.0)

                VStack(alignment: .leading, spacing: 4.0) {
                    Text(job.title)
                        .font(.headline)
                    Text(job.company)
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom, 8.0)

            if job.location != nil {
                JobDetailView(imageName: "mappin.circle", info: job.location!, infoColor: .primary)
            }

            if job.salary != nil {
                JobDetailView(imageName: "dollarsign.circle", info: job.salary!, infoColor: .green)
            }

            if job.tags != nil && !job.tags!.isEmpty {
                JobDetailView(imageName: "tag.circle", info: job.tags!.joined(separator: ", "), infoColor: .orange)
            }
        }
    }
}

struct JobDetailView: View {
    var imageName: String
    var info: String
    var infoColor: Color
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24.0, height: 24.0)
                .foregroundColor(infoColor)
            Text(info)
                .foregroundColor(infoColor)
        }
        .padding(.horizontal, 8.0)
    }
}

struct JobItemView_Previews: PreviewProvider {
    static var previews: some View {
        let job = Job(
            title: "iOS Engineer",
            company: "Apple",
            url: URL(string: "https://www.apple.com")!,
            salary: "100K/Annual",
            logo: nil,
            location: "Infinite Loop 1, Mountain View, CA",
            tags: ["Apple", "iOS", "Change the world", "Richest Company", "iPhone", "iPad"]
        )

        Group {
            JobItemView(job: job)
            JobItemView(job: job)
                .preferredColorScheme(.dark)
        }
    }
}
