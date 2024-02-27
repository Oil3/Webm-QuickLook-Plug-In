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
//        webView.pauseAllMediaPlayback()             //webView.load(URLRequest(url: URL(string: "about:blank")!))
        //we stop first to ensure the previous video is not running in the background
        webView.loadFileURL(url, allowingReadAccessTo: url) 

        completionHandler(nil)  
}
    
    override func loadView() {
        self.view = NSView()
        self.view.addSubview(webView)
//        
        webView.pageZoom = 0.4
//        webView.setValue(false, forKey: "drawbackground")   
        webView.allowsMagnification  = true
//        webView.configuration.mediaPlaybackRequiresUserAction = true
        webView.autoresizingMask = [.width, .height]
        webView.translatesAutoresizingMaskIntoConstraints = true
}    
    override func viewWillDisappear() {
        super.viewWillDisappear()

        // Stop loading and clear the web view when the view is about to disappear
        webView.stopLoading()
        webView.load(URLRequest(url: URL(string: "about:blank")!))
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("Navigation failure: \(error.localizedDescription)")
}}

