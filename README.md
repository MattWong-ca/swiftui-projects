# 📱 SwiftUI Projects
This repo contains a collection of SwiftUI projects I've made!

# 1. Pokédex
A Pokemon Pokedex that fetches data from a CSV file to display a list of 720+ Pokemons. Each Pokemon has its own profile that shows their types, stats, and an image.

<img width="200" alt="Pokedex ContentView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/674a6db9-6b69-41b0-85de-b530cfeedd3e">
<img width="200" alt="Charizard" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/60737fca-b293-47ce-b6eb-10208cfe5e96">
<img width="200" alt="Blastoise" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/a10fdf3e-4b4f-4d04-9d8d-41e43e67365c">
<img width="200" alt="Volcanion" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/87a0a27d-fe5c-4069-9152-4c48ce9c8db9">

### Views
`ContentView`: a `List` is used inside a `NavigationView`, where each `NavigationLink` links to a `PokemonDetailView` of the titled Pokemon. The colored type tags are reusable `PokemonTypeView`s that are also used in `PokemonDetailView`. The `pokedex` array of Pokemon passed in is from the `loadCSVData()` function in `CSVManager` (called in `PokedexApp`).

`PokemonTypeView`: small colored tags that show the Pokemon's type. The Pokemon's type as a string is passed in --> this is used for 1) the  text and 2) the different colored backgrounds, which match the appropriately-named colors in Assets (eg. `.background(Color(pokemonType))`).

`PokemonDetailView`: view that shows up when a Pokemon in the list is clicked. It displays the Pokemon's properties through HStacks/VStacks in the appropriate Sections.

`PokemonImageView`: called in `PokemonDetailView` to display the Pokemon's image. Important `fetchImage()` used to fetch the image from `PokeAPI` (only the image URLs they provide are used, didn't get the JSON data back and decode it). It uses a `URLSession` where the data is passed into a `UIImage`.

### Models
`pokemon.csv`: contains list of 720+ Pokemons. First 3 lines:

```
#,Name,Type 1,Type 2,Total,HP,Attack,Defense,Sp. Atk,Sp. Def,Speed,Generation,Legendary
1,Bulbasaur,Grass,Poison,318,45,49,49,65,65,45,1,False
2,Ivysaur,Grass,Poison,405,60,62,63,80,80,60,1,False
```

`Pokemon`: the Pokemon object struct, conforming to `Identifiable` protocol. A Pokemon is an array of Strings, with each String representing 1 attribute (eg. Pokemon = one row in the CSV).

`CSVManager`: the function `loadCSVData()` returns an array of Pokemon objects (eg. `[["Bulbasaur", "1"], ["Charmander", "2"], ["Squirtle", "3"]]`). It takes the file path of the CSV file, turns its content into one giant string, cleans up the rows, separates data into an array of rows (strings), separates each row so each of its properties are a string, then creates a Pokemon and adds it to the array that'll be returned.

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
