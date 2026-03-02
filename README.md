# Pokemon Mobile Core

This repository is a Flutter monorepo for a Pokémon-themed mobile application. It is structured to promote code sharing, separation of concerns, and scalability.

## 🚀 Getting Started

This project uses [Melos](https://melos.invertase.dev/) to manage the monorepo.

1.  **Activate Melos:**
    ```sh
    dart pub global activate melos
    ```

2.  **Bootstrap the project:**
    This command will install dependencies for all packages and link them together.
    ```sh
    melos bootstrap
    ```

3.  **Run the app:**
    You can run the main application from the root directory.
    ```sh
    flutter run --target pokemon_base/lib/main.dart
    ```

## 📦 Packages

This monorepo contains the following packages:

| Package | Path | Description |
|---|---|---|
| 📱 **App** | `pokemon_base` | The main Flutter application that brings all other packages together. |
| ✨ **Features** | `pokemon_packages/pokemon_features` | Contains individual application features (e.g., Pokedex, Pokemon Details). |
| 🎨 **UI Kit** | `pokemon_packages/pokemon_ui_kit` | A package of shared and reusable UI widgets and theme definitions. |
| 🧰 **Core** | `pokemon_packages/pokemon_core` | Shared utilities, constants, and core business logic used across multiple packages. |
| 📚 **Repositories** | `pokemon_packages/pokemon_repositories` | The repository layer, abstracting data sources from the rest of the app. |
| 📦 **Models** | `pokemon_packages/pokemon_models` | Contains the shared Dart data models (e.g., `Pokemon`, `Ability`). |
| 🌐 **API Client** | `pokemon_packages/poke_api_client` | A low-level client for communicating with the PokéAPI. |

## 🧪 Running Tests

```sh
melos run test
```