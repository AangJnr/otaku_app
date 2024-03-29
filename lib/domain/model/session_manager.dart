import 'package:otaku_katarougu_app/data/local/session_manager_service.dart';

import 'user.dart';

abstract class SessionManager {
  bool isLoggedIn();
  bool isFirstRun();
  void setUserAsLoggedIn();
  void invalidate();
  String? getAccessToken();
  void setAccessToken(String? token);
  void setAppState(AppState appState);
  AppState getAppState();
  void setUser(User userProfile);
  User getUser();
}
