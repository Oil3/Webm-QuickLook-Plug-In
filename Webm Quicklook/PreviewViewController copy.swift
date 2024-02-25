//
//  PreviewViewController.swift
//  WebM Quicklook
//
//  Created by ZZS on 18/02/2024.
//

import Cocoa
import Quartz
import WebKit

class PreviewViewController: NSViewController, QLPreviewingController {
   
    override var nibName: NSNib.Name? {
        return NSNib.Name("PreviewViewController")
    }
  
    var webView: WKWebView = WKWebView(frame: .zero)

    required init?(coder: NSCoder) { fatalError() }
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func loadView() {
        self.view = NSView()
        self.view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints to fill the entire view
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func preparePreviewOfFile(at url: URL, completionHandler: @escaping (Error?) -> Void) {
        // Load the file URL in webView
        webView.loadFileURL(url, allowingReadAccessTo: url)
        completionHandler(nil)
    }
        
    func webView(_ webView: WKWebView, didStart navigation: WKNavigation!) {
        webView.pauseAllMediaPlayback {
        }
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("Navigation failure: \(error.localizedDescription)")
    }

}
