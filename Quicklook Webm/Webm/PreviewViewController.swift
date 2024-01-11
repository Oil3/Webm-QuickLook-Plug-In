//
//  PreviewViewController.swift
//  Plugin
//
//  Created by ZZS on 08/01/2024.
//

import Cocoa
import Quartz
import WebKit

class PreviewViewController: NSViewController, QLPreviewingController, WKNavigationDelegate {
    
    let webView: WKWebView
    var previewedFileURL: URL?
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        webView = WKWebView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func loadView() {
        super.loadView() //Zdo i keep tjis?
        self.view = webView
        webView.navigationDelegate = self
    }

       
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("Navigation failure: \(error.localizedDescription)")
    }

        
    func preparePreviewOfFile(at url: URL, completionHandler: @escaping (Error?) -> Void) {
        previewedFileURL = url
        webView.loadFileURL(url, allowingReadAccessTo: url)
        completionHandler(nil)
    }
}
