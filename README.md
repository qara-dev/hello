# hello

This repository is a monorepo Flutter project template using FVM, Melos, and Mason for scalable development.

## Getting Started

### Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install) (managed via [FVM](https://fvm.app/))
- [FVM](https://fvm.app/documentation/getting-started)
- [Melos](https://melos.invertase.dev/)
- [Mason](https://docs.brickhub.dev/docs/cli/overview)

### 1. Install FVM and Flutter SDK

Install FVM globally:
```sh
pub global activate fvm
```

Install the required Flutter version (see `.fvmrc`):
```sh
fvm install
```

Use FVM for all Flutter commands in this project:
```sh
fvm flutter --version
```

### 2. Bootstrap the Monorepo with Melos

Install Melos globally:
```sh
dart pub global activate melos
```

Bootstrap all packages:
```sh
melos bootstrap
```

### 3. Install Mason (for code generation)

Install Mason globally:
```sh
dart pub global activate mason_cli
```

List available bricks:
```sh
mason list
```

Generate code from a brick (example):
```sh
mason make clean_bloc
```

### 4. Run the App

Navigate to the app directory and run:
```sh
cd app
fvm flutter run
```

### 5. Useful Melos Scripts

- Format code:
  ```sh
  melos format-code
  ```
- Analyze code:
  ```sh
  melos analyze
  ```
- Run tests:
  ```sh
  melos unit-test
  ```
- Clean build artifacts:
  ```sh
  melos flutter-clean
  ```

See `melos.yaml` for more scripts and details.

## Project Structure

- `app/` — Main Flutter application
- `packages/` — Reusable Dart/Flutter packages
- `bricks/` — Mason bricks for code generation

