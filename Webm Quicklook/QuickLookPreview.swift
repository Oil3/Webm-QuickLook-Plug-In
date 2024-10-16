//
//  QuickLookPreview.swift
//  Webm Quicklook
//
//  Created by ZZS on 18/02/2024.
//

import SwiftUI
import Quartz
import WebKit

struct QuickLookPreview: NSViewRepresentable {
    var url: URL
    var autostarts: Bool = true

    func makeNSView(context: Context) -> QLPreviewView {
        let preview = QLPreviewView()
        preview.autostarts = autostarts
        return preview
    }

    func updateNSView(_ nsView: QLPreviewView, context: Context) {
        nsView.previewItem = url as QLPreviewItem
    }
}
