import SwiftUI
import WebKit

@main
struct MockWalletApp: App {
    var body: some Scene {
        WindowGroup { WebView().ignoresSafeArea() }
    }
}

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let w = WKWebView(frame: .zero)
        w.scrollView.bounces = false
        w.scrollView.contentInsetAdjustmentBehavior = .never
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            w.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        return w
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
