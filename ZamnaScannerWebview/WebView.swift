//
//  WebView.swift
//  ZamnaScannerWebview
//
//  Created by Den on 28/06/2022.
//

import Foundation
import WebKit
import SwiftUI

struct WebView : UIViewRepresentable {
    let config: WKWebViewConfiguration
    let request: URLRequest


    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView(frame: .zero, configuration: config)
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }

}
