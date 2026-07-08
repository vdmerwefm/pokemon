# pokemon_mobile_core

This repository is a monorepo for the Pokemon mobile application core and tooling. It centers on a modular, multi-package architecture managed with Melos to simplify multi-package workflows (bootstrap, build, test, versioning, and publishing).

## Quick summary

- **Monorepo manager:** Melos (see [melos.yaml](melos.yaml))
- **Language / platform:** Dart & Flutter (multi-platform iOS / Android)
- **Primary focus:** clear package boundaries, fast local iteration, reproducible CI pipelines

## What this README covers

This README emphasizes:

- Melos processes and commands used to manage the monorepo
- Architectural choices and rationale behind the repository layout

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed:

- **Dart 3.8.1** and **Flutter 3.32.8**
- **iOS 15.6+** and **Xcode 26.0** (for iOS development)
- **Android API 21–35**, **Android SDK 37.0.0**, **Android NDK 27.0.12077973**, and **Java 21** (for Android development)

See the [Platform-specific setup](#platform-specific-setup) section for detailed requirements.

### Quick Start

This project uses [Melos](https://melos.invertase.dev/) to manage the monorepo. Follow these steps to set up and run the app:

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/vdmerwefm/pokemon.git
    cd pokemon
    ```

2.  **Install Melos globally:**
    ```sh
    dart pub global activate melos
    ```

3.  **Run the complete setup:**
    ```sh
    melos clean-build
    ```
    This command cleans generated files, installs dependencies, and regenerates all code in one step.

4.  **Run the app:**
    
    **Using VS Code (Recommended):**
    Launch configurations are defined in `.vscode/launch.json`. The default **"Pokemon"** configuration runs the production build. Select a configuration from the Run and Debug panel:
    - **Pokemon** — Production build (default)
    - **Pokemon Staging** — Staging build with release mode
    - **Pokemon Development** — Development build
    - **Pokemon Android Physical** — Production for Android physical device
    - **Pokemon iOS Physical** — Production for iOS physical device (release mode)
    
    **Command line alternative:**
    ```sh
    melos exec --package pokemon_base -- flutter run --target lib/main_development.dart
    ```
    For other environments, use `lib/main_staging.dart` or `lib/main_production.dart` instead.

### Next Steps After Setup

- Review the [Development workflow (onboarding)](#development-workflow-onboarding) section for detailed development practices
- For continuous code generation during development, use `melos run auto-build` instead of `melos clean-build`

## Repository layout (high level)

- `pokemon_base/` — The main Flutter application and platform configuration. App entrypoints (`lib/main_development.dart`, `lib/main_staging.dart`, `lib/main_production.dart`), platform integration, and app-level build configs live here. `pokemon_base` composes and depends on packages from `pokemon_packages/`.

- `pokemon_packages/` — collection of reusable, focused Dart/Flutter packages. High-level package breakdown:
    - `pokemon_packages/poke_api_client` — REST client and low-level networking for the PokéAPI.
    - `pokemon_packages/poke_gql_client` — GraphQL client, generated schema/artifacts, and query helpers.
    - `pokemon_packages/pokemon_audio_kit` — audio utilities, wrappers, and bundled audio assets.
    - `pokemon_packages/pokemon_core` — shared utilities, services, configuration, and cross-cutting logic.
    - `pokemon_packages/pokemon_features` — feature modules containing screens, flows, and feature-specific widgets.
    - `pokemon_packages/pokemon_models` — shared data models, DTOs, and (de)serialization code.
    - `pokemon_packages/pokemon_repositories` — repository layer that abstracts data sources (API, local cache, etc.).
    - `pokemon_packages/pokemon_ui_kit` — shared UI components, theming, and design system primitives.

- `android/` and `ios/` — platform runner projects, native plugins, and platform-specific build configuration used by `pokemon_base`.

- `build/` — generated outputs produced by local builds and CI; not a source-of-truth for code. Avoid committing large generated artifacts.

For package-level details, inspect the `pubspec.yaml` files under `pokemon_packages/` and the `pokemon_base` package manifest.

## Architectural choices — why this structure?

- **Modular packages:** Functionality is split into packages (core, features, models, repositories, UI kit, clients) to:
    - speed up incremental rebuilds and tests,
    - enable independent versioning of reusable libraries,
    - make code review and ownership clearer.
    - define a clear separation of concerns based on package responsibilites
- **Separation of concerns:** The monorepo structure explicitly enforces separation of concerns through package boundaries. Each package is a distinct concern boundary. it is only aware of and depends on the specific packages it needs. A package cannot reach into or depend on arbitrary other packages; dependencies must be intentional and explicit in `pubspec.yaml`. This constraint ensures a safer development process: developers know exactly where their changes belong, unintended side effects are minimized, and code review becomes more focused. Platform-specific code is further isolated in `android/` and `ios/` while shared logic lives in packages, keeping Flutter widgets and business logic platform-agnostic.
- **Client adapters:** API and GraphQL clients (e.g., in `poke_api_client` and `poke_gql_client`) are isolated so swapping or mocking backends is straightforward.
- **CI-friendly:** The repository is designed to let CI run package-level checks and selective builds to reduce pipeline time.

## Melos — what it covers here

Melos is the canonical tool used to manage the monorepo. Key responsibilities it covers in this repo:

- **Workspace orchestration:** bootstrapping dependencies for all packages consistently.
- **Task orchestration:** run scripts, tests, analyzers, and formatters across all or selected packages.
- **Versioning & publishing:** Melos provides `melos version` and `melos publish` to bump package versions and publish packages. Workflows often wrap these (or CI automations) to publish multiple packages atomically when required.
- **Total execution:** run scripts or commands across the entire workspace (all packages and apps) to perform full builds, tests, or app runs. This repository's `melos.yaml` can define workspace-level scripts that trigger total execution flows.
- **Selective execution:** run commands only in packages that changed or match glob patterns for faster iteration.

See the workspace config at [melos.yaml](melos.yaml) for the exact package graph and defined scripts.

### Melos commands used in this project

Run these from the repository root.

```bash
# Install melos globally from the repository root (if not already installed):
dart pub global activate melos

# install and link dependencies across packages
melos bootstrap

# install or update package dependencies
melos run get

# run code generation across all packages
melos run build

# run code generation in watch mode (continuous)
melos run auto-build

# full clean rebuild - removes generated files, reinstalls deps, regenerates code
melos clean-build

# full clean rebuild in watch mode
melos clean-auto-build

# run code analysis across all packages (out-of-the-box, not customized for this project)
melos run analyze

# run tests across all packages (out-of-the-box, not customized for this project)
melos run test

```

Notes:
- **`melos clean` is explicitly invoked by `clean-build` and `clean-auto-build` scripts:** The `melos clean` command has a thorough post-hook (defined in `melos.yaml`) that removes generated and override files: `*.g.dart`, `*.freezed.dart`, `*.module.dart`, `*.config.dart`, `*.gm.dart`, and `pubspec_overrides.yaml`. This ensures a fresh state before rebuilding.
- **`melos run get`** — Installs or updates package dependencies across all packages. Runs `flutter pub get` for each package.
- **`melos run build`** — Runs code generation (build_runner) across all packages, handling `pokemon_base` dependencies last to ensure other packages generate first.
- **`melos run auto-build`** — Same as `build` but in watch mode, continuously regenerating code as files change. Useful for development workflows.
- **`melos run clean-build`** — Full clean rebuild: cleans all generated files, reinstalls dependencies, and regenerates code across all packages. Use this when you need a completely fresh state.
- **`melos run clean-auto-build`** — Same as `clean-build` but continues in watch mode after rebuild, useful for development when you need a fresh start and then continuous rebuilding.
- **`melos run analyze`** — Runs `flutter analyze` across all packages. This is an out-of-the-box command and has not been customized or amended for this specific application.
- **`melos run test`** — Runs `flutter test` across all packages. This is an out-of-the-box command and has not been customized or amended for this specific application.

## Development workflow (onboarding)

1. Clone the repo.
2. Install Melos globally: `dart pub global activate melos`
3. Run `melos clean-build` to perform a full clean build with all dependencies and code generation.

### Platform-specific setup

Before running the app, ensure your platform setup is complete:

**Dart & Flutter:**
- Dart 3.8.1
- Flutter 3.32.8
- All dependencies installed via `flutter pub get` (handled by `melos clean-build`)

**iOS:**
- iOS 15.6 or later
- Xcode 26.0
- CocoaPods (usually installed with Xcode)
- Run `pod install` in `pokemon_base/ios/` if needed (typically handled automatically)

**Android:**
- Android API level 21 (minSdkVersion) to 35 (targetSdkVersion)
- Android SDK build-tools 37.0.0
- Android NDK 27.0.12077973
- Java 21 (check `java -version`)
- Android emulator or physical device with Android 5.0+ (API 21+)

## CI integration suggestions

- Use `melos bootstrap` in CI to ensure consistent dependency resolution.
- Run `melos run analyze` and `melos run test` in parallel for packages where possible.
- Use selective package detection (changed files) to limit work in CI for small PRs.

## Where to look next

- Workspace config: [melos.yaml](melos.yaml)
- Top-level package listing: `pokemon_packages/`
- App entrypoints: `lib/main_development.dart`, `lib/main_staging.dart`, `lib/main_production.dart`

## Notes

**Configuration file exposure:**
The `poke_config.json` file is typically gated and not committed to version control. However, since this file contains no private information (API keys, secrets, or sensitive credentials), it has been made available in this repository to allow straightforward application launch. In real-world production scenarios, configuration files—even those without secrets—should generally follow a gating strategy and be managed through secure configuration management systems or environment variables. This decision was made specifically for this project's accessibility and ease of setup.

## 📦 Packages

This monorepo contains the following packages:

| Package | Path | Description |
|---|---|---|
| 📱 **App** | `pokemon_base` | The main Flutter application that brings all other packages together. |
| 🔊 **Audio Kit** | `pokemon_packages/pokemon_audio_kit` | Audio utilities, wrappers, and bundled audio assets. |
| 🧰 **Core** | `pokemon_packages/pokemon_core` | Shared utilities, constants, and core business logic used across multiple packages. |
| ✨ **Features** | `pokemon_packages/pokemon_features` | Contains individual application features (e.g., Pokedex, Pokemon Details). |
| 📡 **GraphQL Client** | `pokemon_packages/poke_gql_client` | GraphQL client with generated schema artifacts and query helpers. |
| 📦 **Models** | `pokemon_packages/pokemon_models` | Contains the shared Dart data models (e.g., `Pokemon`, `Ability`). |
| 📚 **Repositories** | `pokemon_packages/pokemon_repositories` | The repository layer, abstracting data sources from the rest of the app. |
| 🌐 **REST API Client** | `pokemon_packages/poke_api_client` | A low-level REST client for communicating with the PokéAPI. |
| 🎨 **UI Kit** | `pokemon_packages/pokemon_ui_kit` | A package of shared and reusable UI widgets and theme definitions. |
