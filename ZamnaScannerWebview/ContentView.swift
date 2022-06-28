//
//  ContentView.swift
//  ZamnaScannerWebview
//
//  Created by Den on 28/06/2022.
//

import SwiftUI
import AVFoundation
import WebKit

struct ContentView: View {
    @State var isConfigurationDone = false
    var config: WKWebViewConfiguration {
        let c = WKWebViewConfiguration()
        c.allowsInlineMediaPlayback = true
        return c
    }

    @ViewBuilder
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                run()
            }
        if (isConfigurationDone)  {
            WebView(
                config: config,
                request: URLRequest(url: URL(string: "https://testik.zamna.com")!)
            )
        } else {
            EmptyView()
        }
    }

    func run() {
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)

        switch cameraAuthorizationStatus {
        case .notDetermined: requestCameraPermission()
        case .authorized: loadWebview()
        case .restricted, .denied:
            print("Denied camera access.")
        default:
            print("Unexpected thing happened.")
        }
    }

    func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted {
                self.loadWebview()
            }
        }
    }

    func loadWebview() {

        isConfigurationDone = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
