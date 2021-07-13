//
//  JobWebPageView.swift
//  JobHunter-SwiftUI
//
//  Created by Nelson on 2021/7/12.
//

import SwiftUI
import SafariServices

struct JobWebPageView: View {
    let url: URL
    var body: some View {
        SafariView(url: url)
    }
}

struct JobWebPageView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://www.google.com/tw")!
        JobWebPageView(url: url)
    }
}

final class SafariViewControllerWrapper: UIViewController {
    var url: URL? {
        didSet {
            // when url changes, reset the safari child view controller
            configureChildViewController()
        }
    }

    private var safariViewController: SFSafariViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureChildViewController()
    }

    private func configureChildViewController() {
        // Remove the previous safari child view controller if not nil
        if let safariViewController = safariViewController {
            safariViewController.willMove(toParent: nil)
            safariViewController.view.removeFromSuperview()
            safariViewController.removeFromParent()
            self.safariViewController = nil
        }

        guard let url = url else { return }

        // Create a new safari child view controller with the url
        let newSafariViewController = SFSafariViewController(url: url)
        addChild(newSafariViewController)
        view.addSubview(newSafariViewController.view)
        newSafariViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newSafariViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            newSafariViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newSafariViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newSafariViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        newSafariViewController.didMove(toParent: self)
        self.safariViewController = newSafariViewController
    }
}


struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SafariViewControllerWrapper
    var url: URL?

    func makeUIViewController(context: Context) -> SafariViewControllerWrapper {
        return SafariViewControllerWrapper()
    }

    func updateUIViewController(_ safariViewController: SafariViewControllerWrapper, context: Context) {
        if url != safariViewController.url {
            safariViewController.url = url
        }
    }
}
