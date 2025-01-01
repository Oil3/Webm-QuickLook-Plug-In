import Cocoa
import Quartz
import WebKit

class PreviewViewController: NSViewController, QLPreviewingController {
  
  var webView = WKWebView(frame: .zero)
  static var activeWebViews = NSHashTable<WKWebView>.weakObjects() // Keeps track of active web views
  
  func preparePreviewOfFile(at url: URL, completionHandler: @escaping (Error?) -> Void) {
      // Pause all other active web views
    for webView in PreviewViewController.activeWebViews.allObjects {
      webView.evaluateJavaScript("""
            var videos = document.getElementsByTagName('video');
            for (var i = 0; i < videos.length; i++) {
                videos[i].pause();
                videos[i].currentTime = 0; // Reset playback to the beginning
            }
            """, completionHandler: nil)
    }
    
      // Add the current web view to the active list
    PreviewViewController.activeWebViews.add(webView)
    
      // Clear any existing content in this web view
    webView.stopLoading()
    webView.load(URLRequest(url: URL(string: "about:blank")!))
    
      // Load the new video file
    webView.loadFileURL(url, allowingReadAccessTo: url)
    
      // Inject JavaScript to handle video playback events
    let playPauseHandlerJS = """
        document.addEventListener('play', function(event) {
            var videos = document.getElementsByTagName('video');
            for (var i = 0; i < videos.length; i++) {
                if (videos[i] !== event.target) {
                    videos[i].pause();
                }
            }
        }, true);
        """
    webView.configuration.userContentController.addUserScript(WKUserScript(source: playPauseHandlerJS, injectionTime: .atDocumentStart, forMainFrameOnly: true))
    
    completionHandler(nil)
  }
  
  override func loadView() {
    self.view = NSView()
    self.view.addSubview(webView)
    
    webView.pageZoom = 0.8
    webView.allowsMagnification = true
    webView.autoresizingMask = [.width, .height]
    webView.translatesAutoresizingMaskIntoConstraints = true
  }
  
  override func viewWillDisappear() {
    super.viewWillDisappear()
    
      // Pause all videos in the current web view
    webView.evaluateJavaScript("""
        var videos = document.getElementsByTagName('video');
        for (var i = 0; i < videos.length; i++) {
            videos[i].pause();
        }
        """, completionHandler: nil)
    
      // Remove the web view from active list
    PreviewViewController.activeWebViews.remove(webView)
    
    webView.stopLoading()
    webView.removeFromSuperview()
  }
  
  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    print("Navigation failure: \(error.localizedDescription)")
  }
}
