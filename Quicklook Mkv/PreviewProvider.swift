  //
  //  PreviewProvider.swift
  //  QuickLook Preview Extension
  //
  //  Created by Xiaolin Wang on 26/03/2024.
  //

import Cocoa
import Quartz

class PreviewProvider: QLPreviewProvider, QLPreviewingController {
  
  
  /*
   Use a QLPreviewProvider to provide data-based previews.
   
   To set up your extension as a data-based preview extension:
   
   - Modify the extension's Info.plist by setting
   <key>QLIsDataBasedPreview</key>
   <true/>
   
   - Add the supported content types to QLSupportedContentTypes array in the extension's Info.plist.
   
   - Change the NSExtensionPrincipalClass to this class.
   e.g.
   <key>NSExtensionPrincipalClass</key>
   <string>$(PRODUCT_MODULE_NAME).PreviewProvider</string>
   
   - Implement providePreview(for:)
   */
  
  func providePreview(for request: QLFilePreviewRequest) async throws -> QLPreviewReply {
    
    let reply = QLPreviewReply(dataOfContentType: UTType.html, contentSize: CGSize(width: 750, height: 500)) { reply in
      
      let videoFileData = try! Data(contentsOf: request.fileURL)
      
      reply.attachments["videoFile"] = QLPreviewReplyAttachment(data: videoFileData, contentType: UTType(importedAs: "org.matroska.mkv"))
      
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
                                            <video controls src=\"cid:videoFile\" type="video/x-matroska"</video>
                                          </body>
                                        </html>
""".utf8)
    }
    
    reply.title = request.fileURL.lastPathComponent
    
    return reply
  }
} 
