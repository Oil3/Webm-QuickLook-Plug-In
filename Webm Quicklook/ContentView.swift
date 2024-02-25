//
//  ContentView.swift
//  Webm Quicklook
//
//  Created by ZZS on 18/02/2024.
//

import SwiftUI

struct ContentView: View {
     let sampleFileURL = Bundle.main.url(forResource: "sample", withExtension: "webm")!

    var body: some View {
        VStack {
            Image(systemName: "puzzlepiece.extension")
            Image(systemName: "powerplug")
            Text("Sample WebM file should play using Quicklook")
            QuickLookPreview(url: sampleFileURL)
            .onDisappear {
            NSApplication.shared.terminate(nil)
            }
        }
//        .frame(width: 800, height: 300) // Set the desired frame size
    }
}


// Preview for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

