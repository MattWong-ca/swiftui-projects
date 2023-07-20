# 📱 SwiftUI Projects
This repo contains a collection of SwiftUI projects I've made!

# 1. Hacker News
Hacker News uses the HN Algolia API (`hn.algolia.com/api`) to fetch a list of front-page articles on Hacker News. The results are returned in a list ordered by the number of points they received.

### Views
`ContentView`: creates an instance of `NetworkManager()` for fetching API data. At `.onAppear`, `fetchData()` is called. The body view uses a `NavigationView` to go back/forth from article links. Each row in the List is a `NavigationLink` with a destination set to a `DetailView`, and text showing the points + article title.

`DetailView`: the view that pops up when someone clicks an article title. It shows the `WebView` by instantiating `WebView(urlString: url)` and passing in the article's URL.

`WebView`: conforms to `UIViewRepresentable` protocol in order to use `WKWebView`. The protocol requires 1) `makeUIView` which makes the WebKit WebView and turns it to a SwiftUI-compatible WebView, and 2) `updateUIView` which updates the view with new info from SwiftUI.

### Models
`NetworkManager`: placeholder

`PostData`: placeholder

<img width="450" alt="Hacker News main page" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/30911b47-278f-418d-9a1b-c2eee549232e">
<img width="450" alt="Hacker News WebView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/c91fe37d-6959-4623-b33e-9a6a9fda68b3">
