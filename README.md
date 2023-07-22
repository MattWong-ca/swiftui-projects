# 📱 SwiftUI Projects
This repo contains a collection of SwiftUI projects I've made!

# 1. Pokédex
A Pokemon Pokedex that fetches data from a CSV file

<img width="200" alt="Pokedex ContentView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/674a6db9-6b69-41b0-85de-b530cfeedd3e">
<img width="200" alt="Charizard" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/60737fca-b293-47ce-b6eb-10208cfe5e96">
<img width="200" alt="Blastoise" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/a10fdf3e-4b4f-4d04-9d8d-41e43e67365c">
<img width="200" alt="Volcanion" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/87a0a27d-fe5c-4069-9152-4c48ce9c8db9">


# 2. Hacker News
Hacker News uses the HN Algolia API (`hn.algolia.com/api`) to fetch a list of front-page articles on Hacker News. The results are returned in a list ordered by the number of points they received.

<img width="200" alt="Hacker News ContentView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/30911b47-278f-418d-9a1b-c2eee549232e">
<img width="200" alt="Hacker News WebView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/c91fe37d-6959-4623-b33e-9a6a9fda68b3">

### Views
`ContentView`: creates an instance of `NetworkManager()` for fetching API data. At `.onAppear`, `fetchData()` is called. The body view uses a `NavigationView` to go back/forth from article links. Each row in the List is a `NavigationLink` with a destination set to a `DetailView`, and text showing the points + article title.

`DetailView`: the view that pops up when someone clicks an article title. It shows the `WebView` by instantiating `WebView(urlString: url)` and passing in the article's URL.

`WebView`: conforms to `UIViewRepresentable` protocol in order to use `WKWebView`. The protocol requires 1) `makeUIView` which makes the WebKit WebView and turns it to a SwiftUI-compatible WebView, and 2) `updateUIView` which updates the view with new info from SwiftUI.

### Models
`NetworkManager`: conforms to `ObservableObject` since UI properties in `ContentView` are dependent on `posts` from this class. `fetchData()` function creates URL() and URLSession() instances, and makes async network request with dataTask() to fetch the API data. JSON data is then decoded and `posts` is updated with retrieved data.

`PostData`: a `Results` struct that imitates the JSON data from the API. Conforms to `Decodable` since we want to go from JSON --> struct. `Results` holds a single property `hits`, an array of `Post` objects that defines the properties of an article (eg. points, title, etc.).

# 3. MiiCard
Simple digital business card app that displays 3 contact info buttons. Created a `ButtonLinkView` struct for the contact info buttons to improve code reusability. 

<img width="200" alt="MiiCard ContentView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/8adc9228-c37a-4f38-93f4-d03f44e8161e">
