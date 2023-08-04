# 📱 SwiftUI Projects
This repo contains a collection of SwiftUI projects I've made!

# 1. Pokédex
A Pokemon Pokedex that fetches data from a CSV file to display a list of 720+ Pokemons. Each Pokemon has its own profile that shows their types, stats, and an image.

<img width="200" alt="Pokedex ContentView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/f878799d-ee7c-4de6-a056-e0522ddb5ee7">
<img width="200" alt="Venusaur" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/818f1135-16f3-4bf3-acdf-a8aa72a1f289">
<img width="200" alt="Charizard" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/9d4caf82-e4ce-48c5-8920-45b53b51ddc7">
<img width="200" alt="Blastoise" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/ee25d84a-230a-4883-8d04-9705683fdc66">
<img width="200" alt="Empty search bar" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/92c50dc8-83bb-4f79-b3b1-7afbafcb4e67">
<img width="200" alt="Using search bar" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/519f95e9-86ff-4a7e-812e-92e6a039edd7">
<img width="200" alt="Volcanion" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/2d77892d-fb47-4535-be7b-fdc501ff52df">

### Views
`ContentView`: a `List` is used inside a `NavigationView`, where each `NavigationLink` links to a `PokemonDetailView` of the titled Pokemon. The colored type tags are reusable `PokemonTypeView`s that are also used in `PokemonDetailView`. The `pokedex` array of Pokemon passed in is from the `loadCSVData()` function in `CSVManager` (called in `PokedexApp`). Added a search bar: used a @State searchText property to pass in `.searchable()`, keeping track of what the user inputs. If a Pokemon's name contains the characters they input, it gets added to a new `filteredPokemon` computed array of Pokemon objects that return the list of Pokemon shown when searched.

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

### Notes
- I originally used `Data(contentsOf: )` but that was synchronous URL loading of the images, which can crash the app / lead to UI unresponsiveness
- Where I learned to add the images: [Stack Overflow](https://stackoverflow.com/questions/69239521/unable-to-display-pokemon-image-from-pokeapi-co)
- Tutorial I followed: [Oliver Baumeister](https://www.youtube.com/watch?v=uNst4KS_6DY)

# 2. Weather App
Weather App that uses `CoreLocation` to fetch a user's location and the `OpenWeather API` to fetch the live weather data. Background changes depending on the weather!

### MVP Screenshots
<img width="200" alt="Toronto weather" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/d50614cf-92f4-429a-a2cb-fb44407b369d">
<img width="200" alt="Toronto weather with blue background" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/1429e873-4f41-40c0-a21f-cbae87b9da20">

### Landing Page + User Flow
<img width="200" alt="Landing page" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/7c65275a-23e4-44a6-b7cb-89efaf837b79">
<img width="200" alt="Requesting user's location" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/4762513f-c79d-4480-9384-1b27fe74b39e">
<img width="200" alt="LoadingView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/510df346-03bc-4602-b432-9f2d216e056e">

### Different Cities + Weather Background
<img width="200" alt="SF" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/1a7e9c82-7baa-4bed-b286-eb4ac642108c">
<img width="200" alt="Mumbai" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/03516551-14d0-409a-85cd-12edeb3e355d">
<img width="200" alt="Mexico City" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/73808fcf-562f-44fb-9c96-ee4f1c011d2b">
<img width="200" alt="Rio" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/0a3cab40-1e6d-4222-a0f8-88691ebbb389">
<img width="200" alt="London" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/e4fb52ef-e325-49b3-95f3-66e63b656392">
<img width="200" alt="Nishigocho" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/825b774e-0a06-4845-a7d8-ee536f76cb5c">


# 3. Hacker News
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

# 4. Memory Game
Matching cards memory game.

# 5. MiiCard
Simple digital business card app that displays 3 contact info buttons. Created a `ButtonLinkView` struct for the contact info buttons to improve code reusability. 

<img width="200" alt="MiiCard ContentView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/8adc9228-c37a-4f38-93f4-d03f44e8161e">

