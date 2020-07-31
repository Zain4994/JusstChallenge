import 'package:jusst_challenge/src/core/base_model.dart';
import 'package:jusst_challenge/src/core/resources_provider.dart';

enum HomeScreenType { all, favorite }

class HomeScreenModel extends BaseModel {
  HomeScreenModel(ResourcesProvider resourcesProvider)
      : super(resourcesProvider);

}
