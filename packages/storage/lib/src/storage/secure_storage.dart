import 'package:rest_client/rest_client.dart' show DataParser;

abstract class SecureStorage {
  Future<void> init();

  Future<String?> getValue(SecureStorageKey key);

  Future<void> setValue(SecureStorageKey key, String value);

  Future<void> deleteValue(SecureStorageKey key);

  Future<void> deleteAllValues();

  Future<P?> getJson<P>(SecureStorageKey key, {required DataParser<P> parser});

  Future<void> saveJson(SecureStorageKey key, Object data);
}

enum SecureStorageKey {
  authToken('authToken'),
  refreshToken('refreshToken');

  const SecureStorageKey(this.title);

  final String title;
}
