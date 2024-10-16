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
            
            Text("Gesture zoom (trackpad) enabled,           ")
            QuickLookPreview(url: sampleFileURL)
            .frame(width: 800, height: 300)
            .onDisappear {
                NSApplication.shared.terminate(nil) 
}}}}
//        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

