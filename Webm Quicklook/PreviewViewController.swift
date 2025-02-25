import Cocoa
import Quartz
import WebKit

class PreviewViewController: NSViewController, QLPreviewingController {
  
  var webView = WKWebView(frame: .zero)
  
  func preparePreviewOfFile(at url: URL) async {
    // Stop any previous media playback to avoid conflicts
    webView.stopLoading()
    webView.load(URLRequest(url: URL(string: "about:blank")!))
    
    // Load the video file
    webView.loadFileURL(url, allowingReadAccessTo: url)
    
    // Only javascript could stop that autoplay
    let pauseVideoJS = """
    var video = document.querySelector('video');
    if (video) {
        video.pause();
    } else {
        document.addEventListener('DOMContentLoaded', function() {
            var video = document.querySelector('video');
            if (video) {
                video.pause();
            }
        });
    }
    """
    // At least using it natively
    webView.configuration.userContentController.addUserScript(WKUserScript(source: pauseVideoJS, injectionTime: .atDocumentEnd, forMainFrameOnly: true))
    
  }
  
  override func loadView() {
    self.view = NSView()
    self.view.addSubview(webView)
    
    webView.pageZoom = 0.6
    webView.allowsMagnification  = true
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
  }
}
