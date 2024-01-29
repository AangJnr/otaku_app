import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/app/services/screen_manager.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../main.dart';
import '../material_inkwell.dart';

class ProfileAvatarWidgetDesktop extends StatelessWidget {
  const ProfileAvatarWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = MainApp.appTheme.accentColor;
    return MaterialInkWell(
        color: color?.withOpacity(0.2),
        onTap: locator<ScreenManagerService>().goToMyProfileScreen,
        splashColor: Colors.white24,
        radiusValue: 50,
        child: Container(
          padding: const EdgeInsets.all(6),
          alignment: Alignment.center,
          height: 40,
          width: 40,
          child: Text(
            'ME',
            textAlign: TextAlign.center,
            style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                color: color, fontWeight: FontWeight.w900, fontSize: 18),
          ),
        ));
  }
}
