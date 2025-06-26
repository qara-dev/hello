# storage

The `storage` package provides a unified abstraction for working with local and secure storage in Flutter applications. It supports storing and retrieving simple values, as well as working with JSON objects, using both shared preferences and secure storage.

## Features

- Local storage using `SharedPreferences` for simple key-value data.
- Secure storage using `FlutterSecureStorage` for sensitive data (e.g., tokens).
- Typed access to booleans, strings, integers, and JSON objects.
- Easy integration with other packages (e.g., `rest_client`).

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  storage:
    path: ../storage
```

## Usage

```dart
import 'package:storage/storage.dart';

final localStorage = LocalStorageImpl(sharedPreferences);
final secureStorage = SecureStorageImpl(localStorage: localStorage);

// Local storage
await localStorage.setBool(LocalStorageKey.isFirstRun, false);
final isFirstRun = localStorage.getBool(LocalStorageKey.isFirstRun);

// Secure storage
await secureStorage.setValue(SecureStorageKey.authToken, 'your_token');
final token = await secureStorage.getValue(SecureStorageKey.authToken);
```

## Additional information

- Local storage is best for non-sensitive data (e.g., app settings).
- Secure storage is recommended for sensitive data (e.g., authentication tokens).
- See the source code for more advanced usage and available keys.
