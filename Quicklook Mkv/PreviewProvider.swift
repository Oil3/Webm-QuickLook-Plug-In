
import Cocoa
import Quartz

class PreviewProvider: QLPreviewProvider, QLPreviewingController {

  
  func providePreview(for request: QLFilePreviewRequest) async throws -> QLPreviewReply {
    
    let reply = QLPreviewReply(dataOfContentType: UTType.html, contentSize: CGSize(width: 750, height: 500)) { reply in
      
      let videoFileData = try! Data(contentsOf: request.fileURL)
      
      reply.attachments["videoFile"] = QLPreviewReplyAttachment(data: videoFileData, contentType: .video)//UTType(importedAs: "org.webmproject.webm"))
      
      return Data("""
                                        <!DOCTYPE html>
                                        <html>
                                          <head>
                                            <meta charset="utf-8">
                                            <title>QuickLook</title>
                                            <style>
                                                html, body {background-color: black; padding: 0;margin: 0; overflow: hidden; display: flex; justify-content: center; align-items: center; height: 100vh;}
                                                video {width:100%;height:100%; object-fit: contain;}
                                            </style>
                                          </head>
                                          <body>
<video controls  autoplay src=\"cid:videoFile\">
</video>
                                          </body>
                                        </html>
""".utf8)
      
    }
           reply.title = request.fileURL.lastPathComponent
        //    
    return reply
    }
  } 


