//
//  ContentView.swift
//  Quicklook Webm
//
//  Created by ZZS on 08/01/2024.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Text("The app can be now quitted, it is needed for MacOS to acknowledge the embedded plug-in. First load might take a couple seconds. If you move, run-it once again: the actual plug-in is a resource of the app. Native with full hardware acceleration in a sandboxed hardened package.")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
