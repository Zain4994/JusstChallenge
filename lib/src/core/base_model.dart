import 'package:jusst_challenge/src/core/resources_provider.dart';
import 'package:flutter/widgets.dart';

abstract class BaseModel extends ChangeNotifier {
  final ResourcesProvider resourcesProvider;

  BaseModel(this.resourcesProvider);

  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
