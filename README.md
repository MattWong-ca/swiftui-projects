# 📱 SwiftUI Projects
This repo contains a collection of SwiftUI projects I've made!

# 1. Pokédex
A Pokemon Pokedex that fetches data from a CSV file to display a list of 720+ Pokemons. Each Pokemon has its own profile that shows their types, stats, and an image.

<img width="200" alt="Pokedex ContentView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/78c3ef39-82f4-4661-969b-7b10f478ca46">
<img width="200" alt="Venusaur" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/e01dc6f3-84a8-47b2-b4b4-4e727afa9c98">
<img width="200" alt="Charizard" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/9c19c9d0-9303-4e6e-9db1-ae37aa272935">
<img width="200" alt="Blastoise" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/cd0403fd-c8f5-4f1d-8206-97f33107d50f">
<img width="200" alt="Empty search bar" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/3070561d-8a00-4386-967c-683e4ede15d5">
<img width="200" alt="Using search bar" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/c0e7adfe-5bdd-4f4e-8a0b-a2a2701b6112">
<img width="200" alt="Volcanion" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/4c0e0f97-df4a-472c-af96-948f6444fafd">

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

### WIP Screenshots
<img width="200" alt="MVP" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/70f44feb-f86c-4b9e-9b03-62d890f797f6">
<img width="200" alt="MVP" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/57cab686-b231-45b1-84c1-5aa39f435644">

### Landing Page + User Flow
<img width="200" alt="Landing" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/836eda83-31c3-4110-9ae3-2c8e5f701f09">
<img width="200" alt="Location" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/a853abf1-52dc-431e-a6a3-bb97a3e1d7e9">
<img width="200" alt="Loading" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/41bbc299-c7a2-41ad-b437-97155b767936">


### Different Cities + Weather Background
<img width="200" alt="Johannesburg" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/7318d528-e9a0-4dff-877e-aaff41f69ab0">
<img width="200" alt="Mumbai" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/264afd81-4504-4a2f-80ce-7cf07e398d91">
<img width="200" alt="Rio 2023-09-04 at 4 37 52 PM" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/1c058b9e-07f2-4632-ade6-c3373107780f">
<img width="200" alt="Nishigocho 2023-08-04 at 3 50 07 PM" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/324399da-c08f-48d2-a43d-ba52fd2fb26f">
<img width="200" alt="London 2023-08-04 at 3 48 00 PM" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/ef95e6dd-d6fb-4e52-9e5f-ea6360115b34">
<img width="200" alt="Mexico City 2023-08-04 at 3 34 51 PM" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/4eb0d6bc-6161-4e1d-997c-507e0fd35553">

# 3. Hacker News
Hacker News uses the HN Algolia API (`hn.algolia.com/api`) to fetch a list of front-page articles on Hacker News. The results are returned in a list ordered by the number of points they received.

<img width="200" alt="ContentView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/add2110e-8a77-4d6a-83a0-666a2207deaa">
<img width="200" alt="1st WebView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/5f5e8829-914b-49c1-8a58-a89f9acb7bce">
<img width="200" alt="2nd WebView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/b8f148a6-2593-4587-8530-c0af1a062a24">

### Views
`ContentView`: creates an instance of `NetworkManager()` for fetching API data. At `.onAppear`, `fetchData()` is called. The body view uses a `NavigationView` to go back/forth from article links. Each row in the List is a `NavigationLink` with a destination set to a `DetailView`, and text showing the points + article title.

`DetailView`: the view that pops up when someone clicks an article title. It shows the `WebView` by instantiating `WebView(urlString: url)` and passing in the article's URL.

`WebView`: conforms to `UIViewRepresentable` protocol in order to use `WKWebView`. The protocol requires 1) `makeUIView` which makes the WebKit WebView and turns it to a SwiftUI-compatible WebView, and 2) `updateUIView` which updates the view with new info from SwiftUI.

### Models
`NetworkManager`: conforms to `ObservableObject` since UI properties in `ContentView` are dependent on `posts` from this class. `fetchData()` function creates URL() and URLSession() instances, and makes async network request with dataTask() to fetch the API data. JSON data is then decoded and `posts` is updated with retrieved data.

`PostData`: a `Results` struct that imitates the JSON data from the API. Conforms to `Decodable` since we want to go from JSON --> struct. `Results` holds a single property `hits`, an array of `Post` objects that defines the properties of an article (eg. points, title, etc.).

# 4. Sweater Shop
The frontend of a ecommerce sweater store.

<img width="200" alt="ContentView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/858268a3-5282-4496-a560-c32627cb2a91">
<img width="200" alt="ScrollView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/09274510-95b9-4c03-a1d2-05b8e08bc2c6">
<img width="200" alt="Empty cart" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/770e7a5c-82e4-4a26-9c51-9cfcf83461d8">
<img width="200" alt="Filled cart" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/5af896dd-2869-4d64-9060-2c5a067fb813">
<img width="200" alt="CartView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/08aad756-3c7c-43f3-bd67-c94636b0eb6e">

# 5. Memory Game
Matching cards memory game.

# 6. MiiCard
Simple digital business card app that displays 3 contact info buttons. Created a `ButtonLinkView` struct for the contact info buttons to improve code reusability. 

<img width="200" alt="MiiCard ContentView" src="https://github.com/MattWong-ca/swiftui-projects/assets/66754344/9a03ae6c-7be3-483b-a6a2-6f8baa126fb2">
