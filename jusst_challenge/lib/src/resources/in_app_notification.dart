import 'package:bot_toast/bot_toast.dart';
import 'package:jusst_challenge/src/resources/colors_palette.dart';
import 'package:jusst_challenge/src/resources/ui_helper.dart';
import 'package:flutter/material.dart';

class ContactAppNotification {
  static showMessage(
      {@required String message, String iconPath, Color color}) {
    BotToast.showCustomNotification(
        duration: Duration(seconds: 2),
        toastBuilder: (_) {
          return Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 3.0,
                      // has the effect of softening the shadow
                      spreadRadius: 2.0,
                      // has the effect of extending the shadow
                      offset: Offset(
                        0.0, // horizontal, move right
                        4.0, // vertical, move down
                      ))
                ],
                color: color == null ? JusstChallangeAppColor.Blue.getColor() : color,
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: EdgeInsets.all(16),
            height: 56,
            child: Row(
              children: <Widget>[
                UIHelper.horizontalSpace(18),
                if(iconPath != null)
                  UIHelper.horizontalSpace(18),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                UIHelper.horizontalSpace(18),
              ],
            ),
          );
        });
  }

  static void showErrorMessage({String message}) {
    BotToast.showCustomNotification(toastBuilder: (_) {
      return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 3.0,
                  // has the effect of softening the shadow
                  spreadRadius: 2.0,
                  // has the effect of extending the shadow
                  offset: Offset(
                    0.0, // horizontal, move right
                    4.0, // vertical, move down
                  ))
            ],
            color: Colors.red.withOpacity(0.9),
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.all(16),
        height: 56,
        child: Row(
          children: <Widget>[
            UIHelper.horizontalSpace(18),
            Icon(
              Icons.error,
              color: Colors.white,
            ),
            UIHelper.horizontalSpace(18),
            Expanded(
              child: Text(
                message ?? "",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            UIHelper.horizontalSpace(18),

          ],
        ),
      );
    });
  }
}
