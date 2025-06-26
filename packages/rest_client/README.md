# rest_client

The `rest_client` package provides an abstraction for working with REST APIs in Flutter applications using the Dio library. It supports authentication, error handling, interceptors, network utilities, and various helpers.

## Structure

- **lib/**
  - `rest_client.dart` — main library export.
  - **src/**
    - **network/**
      - `rest_client.dart` — base client for network requests.
      - `auth_rest_client.dart` — client with authentication support.
      - `auth_interceptor.dart`, `refresh_token_interceptor.dart`, `locale_interceptor.dart` — interceptors for tokens, locale, and token refresh.
      - `network_error_handler.dart`, `app_failure.dart`, `server_error_body.dart` — error and failure handling.
      - `network_info.dart`, `unauth_rest_client.dart` — network info and unauthenticated client.
    - **utils/**
      - `data_parser.dart`, `try_or_utils.dart`, `extended_error.dart`, `result.dart` — utilities for data parsing, error handling, and results.

- **test/**
  - Tests for the main client components.

## Usage

```dart
import 'package:rest_client/rest_client.dart';

// Example of client initialization
final client = AuthRestClient(
  Dio(),
  secureStorage,
  () => print('Token refresh failed'),
);

FutureOr<List<UserModel>> getUsers() {
  return client.get(
    'users',
    parser: ListParser(
      UserModel.fromJson,
      (json) => json.map((e) => UserModel.fromJson(e)).toList(),
      forKey: "data",
    ),
  );
}

// AuthRestClient - A REST client designed for authenticated requests, typically used when endpoints require user authentication or token-based access.
// UnAuthRestClient - A REST client intended for unauthenticated requests, suitable for accessing public endpoints or resources that do not require authentication.

// Use the client for API requests
```

## Dependencies

- [dio](https://pub.dev/packages/dio)
- [equatable](https://pub.dev/packages/equatable)
- [connectivity_plus](https://pub.dev/packages/connectivity_plus)
- [storage](../storage) (local package)

## License

See the LICENSE file.
