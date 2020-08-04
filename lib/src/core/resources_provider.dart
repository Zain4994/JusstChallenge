import 'package:jusst_challenge/src/core/app_localizations.dart';
import 'package:jusst_challenge/src/resources/colors_palette.dart';
import 'package:flutter/cupertino.dart';

class ResourcesProvider {
  String getString(BuildContext context, String key, [List<String> args]) =>
      AppLocalizations.of(context).translate(key, args ?? []);

  Color getColor(JusstChallangeAppColor contactAppColor) => contactAppColor.getColor();

}
