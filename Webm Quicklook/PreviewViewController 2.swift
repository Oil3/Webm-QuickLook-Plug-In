import Cocoa
import Quartz
import WebKit

class PreviewViewController: NSViewController, QLPreviewingController { 
  var webView = WKWebView(frame: .zero)
  static let globalPauseNotification = Notification.Name("GlobalPauseVideosNotification")
  
  
  func preparePreviewOfFile(at url: URL, completionHandler: @escaping (Error?) -> Void) {
      // Notify all instances to pause their videos
    NotificationCenter.default.post(name: PreviewViewController.globalPauseNotification, object: self)
    clearCache()
    
      // Clear any existing content in this web view
    webView.stopLoading()
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)//, timeoutInterval: 60.0)
    
    webView.load(request) //URL(string: "about:blank")!))
    
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
    
      // Listen for the global pause notification
    NotificationCenter.default.addObserver(self, selector: #selector(pauseAllVideos(_:)), name: PreviewViewController.globalPauseNotification, object: nil)
  }
  
  @objc func pauseAllVideos(_ notification: Notification) {
      // Exclude the sender of the notification
    guard notification.object as? PreviewViewController !== self else { return }
    //clearCache()
    
      // Inject JavaScript to pause all videos in the current web view
    webView.evaluateJavaScript("""
        var videos = document.getElementsByTagName('video');
        for (var i = 0; i < videos.length; i++) {
            videos[i].pause();
        }
        """, completionHandler: nil)
  }
  
  override func viewWillDisappear() {
    super.viewWillDisappear()
    clearCache()
    
      // Pause all videos in the current web view
    pauseAllVideos(Notification(name: PreviewViewController.globalPauseNotification))
    webView.stopLoading()
    webView.removeFromSuperview()
  }
  
  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    print("Navigation failure: \(error.localizedDescription)")
  }
   func clearCache() {
    let dataStore = WKWebsiteDataStore.default()
    dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
      dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), for: records) {
        print("Cache cleared")
      }
    }
    //deinit {
    //b  NotificationCenter.default.removeObserver(self)
     //}
  }
  
}
