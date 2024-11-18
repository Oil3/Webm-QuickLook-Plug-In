//
//  PreviewViewController.swift
//  Quicklook Mkv
//
//  Created by ZZS on 18/11/2024.
//

import Cocoa
import Quartz

class PreviewViewController: NSViewController, QLPreviewingController {

    override var nibName: NSNib.Name? {
        return NSNib.Name("PreviewViewController")
    }

    override func loadView() {
        super.loadView()
        // Do any additional setup after loading the view.
    }

    /*
    func preparePreviewOfSearchableItem(identifier: String, queryString: String?) async throws {
        // Implement this method and set QLSupportsSearchableItems to YES in the Info.plist of the extension if you support CoreSpotlight.

        // Perform any setup necessary in order to prepare the view.
        // Quick Look will display a loading spinner until this returns.
    }
    */

    func preparePreviewOfFile(at url: URL) async throws {
        // Add the supported content types to the QLSupportedContentTypes array in the Info.plist of the extension.

        // Perform any setup necessary in order to prepare the view.

        // Quick Look will display a loading spinner until this returns.
    }

}
