
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/model/session_manager.dart';
 import '../../ui/common/app_strings.dart';

const appStateKey = "appStateKey";
const accessTokenKey = "accessTokenKey";

const emailKey = "emailKey";
const userProfileKey = "userProfileKey";
const userPreferenceKey = "userPreferenceKey";

enum AppState {
  loggedIn,
  login,
  firstRun,
  verification,
  signUp,
  signUpPasswordInfo,
  signUpUserNameInfo,
}

class SessionManagerImpl extends SessionManager {
  final _hiveBox = Hive.box(hiveBoxName);

  @override
  void invalidate() {
    _hiveBox.clear();
    setAppState(AppState.login);
  }

  @override
  bool isFirstRun() {
    return _hiveBox.get(appStateKey) == AppState.firstRun.name;
  }

  @override
  bool isLoggedIn() {
    return _hiveBox.get(appStateKey) == AppState.loggedIn.name;
  }

  @override
  void setUserAsLoggedIn() {
    _hiveBox.put(appStateKey, AppState.loggedIn.name);
  }

  @override
  String? getAccessToken() {
    //Todo Encryption
    debugPrint(_hiveBox.get(accessTokenKey).toString());
    return _hiveBox.get(accessTokenKey) as String?;
  }

  @override
  void setAccessToken(String? token) {
    _hiveBox.put(accessTokenKey, token);
  }

  @override
  AppState getAppState() {
    final v = AppState.values.firstWhere(
        (element) =>
            element.name == (_hiveBox.get(appStateKey) ?? AppState.signUp.name),
        orElse: () => AppState.signUp);
    return v;
  }

  @override
  void setAppState(AppState state) {
    _hiveBox.put(appStateKey, state.name);
  }

}
