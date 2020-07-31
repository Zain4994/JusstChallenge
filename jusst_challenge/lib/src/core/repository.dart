import 'package:jusst_challenge/src/core/api/api_provider.dart';
import 'package:jusst_challenge/src/core/api/local_storage_provider.dart';

class Repository {
  ApiProvider _apiProvider;
  LocalStorageProvider _localStorageProvider;

  Repository(this._apiProvider, this._localStorageProvider);
}
