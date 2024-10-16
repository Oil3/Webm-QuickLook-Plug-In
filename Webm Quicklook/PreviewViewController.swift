import Cocoa
import Quartz
import WebKit

class PreviewViewController: NSViewController, QLPreviewingController, WKNavigationDelegate {

  var webView: WKWebView!
  private var hasExecutedPauseScript = false // Flag to ensure script runs only once

  override func loadView() {
    self.view = NSView()
    
    // Configure WKWebView with a user content controller
    
    
    // JavaScript to pause the video after it loads
    let js = """
        document.addEventListener('DOMContentLoaded', function() {
            var video = document.querySelector('video');
            if (video) {
                video.pause();
                // Notify Swift that the video has been paused
                window.webkit.messageHandlers.jsHandler.postMessage('videoPaused');
            }
        });
        """
    
    let config = WKWebViewConfiguration()
    config.mediaTypesRequiringUserActionForPlayback = .all
    // Initialize WKWebView with the configuration
    webView = WKWebView(frame: .zero, configuration: config)
    webView.navigationDelegate = self
    webView.translatesAutoresizingMaskIntoConstraints = false
    webView.allowsMagnification = true
    webView.pageZoom = 1
    
    self.view.addSubview(webView)
    
    // Set up constraints to make the webView fill the view
    NSLayoutConstraint.activate([
      webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      webView.topAnchor.constraint(equalTo: self.view.topAnchor),
      webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ])
  }
  
  func preparePreviewOfFile(at url: URL, completionHandler: @escaping (Error?) -> Void) {
    // Print the video URL for debugging
    print("Video URL: \(url)")
    
    // Get the directory containing the vi
    
    // Create the HTML string with the video embedded
    let htmlString = """
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>Video Preview</title>
            <style>
                body, html { margin: 0; padding: 0; height: 100%; background-color: black; }
                video { width: 100%; height: 100%; object-fit: contain; }
            </style>
        </head>
        <body>
            <video id="previewVideo" src="\(url)" controls autoplay></video>
        </body>
        </html>
        """
    
    // Load the HTML string into the WKWebView with the baseURL
    webView.loadFileURL(url, allowingReadAccessTo: url)
self.webView.pauseAllMediaPlayback()
    webView.pauseAllMediaPlayback().self
pauseVideo()
    
    completionHandler(nil)
  }
  
  override func viewWillDisappear() {
    super.viewWillDisappear()
    
    // Stop loading and clear the web view when the view is about to disappear
    webView.stopLoading()
    webView.load(URLRequest(url: URL(string: "about:blank")!))
  }
  
  // WKNavigationDelegate method to handle navigation failures
  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    print("Navigation failure: \(error.localizedDescription)")
  }
  
  // WKNavigationDelegate method to confirm successful navigation
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print("Navigation finished successfully.")
    
    // This acts as a fallback in case `viewDidAppear` executes before the video loads
    if !hasExecutedPauseScript {
      hasExecutedPauseScript = true
      pauseVideo()
    }
  }
  
  private func pauseVideo() {
    // JavaScript to pause the video
    self.webView.pauseAllMediaPlayback()
    webView.pauseAllMediaPlayback().self
webView.pauseAllMediaPlayback()
    
    
  }
  // WKScriptMessageHandler method to handle messages from JavaScript
  func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
    if message.name == "jsHandler", let messageBody = message.body as? String {
      print("JavaScript Message: \(messageBody)")
      if messageBody == "videoPaused" {
        // Handle the video paused event if needed
        print("Video has been paused by JavaScript.")
      }
    }
  }
}
