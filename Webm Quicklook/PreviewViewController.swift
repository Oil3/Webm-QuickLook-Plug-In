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
   
    var webView = WKWebView(frame: .zero)

    func preparePreviewOfFile(at url: URL, completionHandler: @escaping (Error?) -> Void) {
        webView.loadFileURL(url, allowingReadAccessTo: url)
        completionHandler(nil)
    }
    
    override func loadView() {
        self.view = NSView()
        self.view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
        
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let cssString = "::-webkit-media-controls-panel { display: none; }"
        let jsString = "var style = document.createElement('style'); style.innerHTML = '\(cssString)'; document.head.appendChild(style);"
        webView.evaluateJavaScript(jsString, completionHandler: nil)
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("Navigation failure: \(error.localizedDescription)")
    }

}
