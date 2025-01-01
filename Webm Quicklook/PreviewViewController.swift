import Cocoa
import Quartz
import WebKit
import UniformTypeIdentifiers

class PreviewViewController: NSViewController, QLPreviewingController {
  
  var webView = WKWebView(frame: .zero)
  
  func preparePreviewOfFile(at url: URL, completionHandler: @escaping (Error?) -> Void) {
      // Load the video data
    do {
      let videoFileData = try Data(contentsOf: url)
      
        // Create the HTML content with the `cid` reference
      let htmlContent = """
            <!DOCTYPE html>
            <html>
            <head>
              <meta charset="utf-8">
              <title>QuickLook</title>
              <style>
                  html, body {background-color: black; padding: 0; margin: 0; overflow: hidden; display: flex; justify-content: center; align-items: center; height: 100vh;}
                  video {width: 100%; height: 100%; object-fit: contain;}
              </style>
            </head>
            <body>
              <video controls autoplay src="cid:videoFile"></video>
            </body>
            </html>
            """
      
        // Create a QLPreviewReply and attach the video file data
      let reply = QLPreviewReply.init(fileURL: <#T##NSURL#>)
      reply.attachments["videoFile"] = QLPreviewReplyAttachment(data: videoFileData, contentType: .movie)
      
        // Load the HTML content into the WKWebView
      webView.loadHTMLString(htmlContent, baseURL: nil)
    } catch {
      print("Error loading video data: \(error.localizedDescription)")
      completionHandler(error)
      return
    }
    
    completionHandler(nil)
  }
  
  override func loadView() {
    self.view = NSView()
    self.view.addSubview(webView)
    
//    webView.pageZoom = 0.4
    webView.allowsMagnification = true
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
