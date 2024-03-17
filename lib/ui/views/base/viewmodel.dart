import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/services.dart';
import 'package:otaku_katarougu_app/app/app.dialogs.dart';
import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/app/app.logger.dart';
import 'package:otaku_katarougu_app/data/local/session_manager_service.dart';
import 'package:otaku_katarougu_app/domain/model/session_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/theme_setup.dart';
import '../../../app/services/screen_manager.dart';
import '../../../domain/model/profile/profile.dart';
import '../../../domain/model/user.dart';
import '../../../main.dart';
import '../../dialogs/login_alert/login_alert_dialog_model.dart';
import 'view_state.dart';

enum Social { WhatsApp, Instagram, LinkedIn, Twitter, Facebook, Email, Phone }

class ViewModel<T extends BaseViewState> extends BaseViewModel {
  InitialState _viewState = InitialState();
  ValueNotifier<BaseViewState> get viewStateNotifier =>
      ValueNotifier(viewState);
  final _screenManager = locator<ScreenManagerService>();
  final _dialogService = locator<DialogService>();
  DialogService get dialogService => _dialogService;
  Profile _profile = const Profile();
  Profile get profile => _profile;
  String _image = '';
  ScreenManagerService get screenManager => _screenManager;
  AppTheme get appTheme => MainApp.appTheme;
  InitialState get viewState => _viewState;
  User get user => sessionManager.getUser();

  String get bannerImageUrl => _image;
  bool get bannerImageLoaded => _image.isNotEmpty;

  SessionManager get sessionManager => locator<SessionManager>();

  void init({Profile? profile}) async {
    if (profile != null) {
      _profile = profile;
    }
    final listOfAssets = await getAssetPaths();
    _image = listOfAssets[Random().nextInt(listOfAssets.length)];
    rebuildUi();
  }

  @override
  void setBusyForObject(Object? object, bool value) {
    if (value) viewState = LoadingViewState();
    super.setBusyForObject(object, value);
  }

  @override
  void setBusy(bool value) {
    if (value) viewState = LoadingViewState();
    super.setBusy(value);
  }

  set viewState(InitialState newValue) {
    _viewState = newValue;
    rebuildUi();
  }

  Future<List<String>> getAssetPaths() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final assetPaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/abs'))
        .toList();
    return assetPaths;
  }

  Future<XFile?> takePicture(ImageSource source) async {
    try {
      XFile? picture = await ImagePicker().pickImage(source: source);
      return picture;
    } catch (e) {
      return null;
    }
  }

  String getLinkPrefix(Social social) {
    return switch (social) {
      Social.WhatsApp => "api.whatsapp.com/send/?phone=",
      Social.Instagram => "www.instagram.com/",
      Social.Facebook => "www.facebook.com/",
      Social.Twitter => "twitter.com/",
      Social.LinkedIn => "www.linkedin.com/in/",
      Social.Email || Social.Phone => "",
    };
  }

  launchSms(String number) {
    final Uri uri = Uri(
      scheme: 'sms',
      path: number,
    );
    _launch(uri);
  }

  launchSocialLink(Social s, String data) {
    final Uri uri = Uri(
      scheme: 'https',
      path: '${getLinkPrefix(s)}$data',
    );
    _launch(uri);
  }

  launchEmail(String email) {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
    );
    _launch(uri);
  }

  makePhoneCall(String phone) {
    final Uri uri = Uri(
      scheme: 'tel',
      path: phone,
    );
    _launch(uri);
  }

  void goToLogin() {
    _dialogService.showCustomDialog(variant: DialogType.loginAlert);
  }

  Future<void> _launch(Uri url) async {
    getLogger('ViewModel').e(url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<DialogResponse?> showCustomDialog({
    String title = '',
    String description = '',
    dynamic data,
    String? positiveButtonTitle,
    String? negativeButtonTitle,
  }) {
    return _dialogService.showCustomDialog(
        variant: DialogType.alert,
        title: title,
        description: description,
        secondaryButtonTitle: negativeButtonTitle,
        mainButtonTitle: positiveButtonTitle,
        data: data);
  }

  Future<DialogResponse?> showLoadingDialog(
      {String? title, String? description, dynamic data}) {
    return dialogService.showCustomDialog(
        variant: DialogType.loadingAlert,
        title: title,
        description: description,
        data: data);
  }

  Future<DialogResponse?> showErrorDialog(
      {String? title, String? description, dynamic data}) {
    return dialogService.showCustomDialog(
        variant: DialogType.alert,
        title: title,
        description: description,
        data: data);
  }

  @override
  get modelError => super.modelError.toString().replaceAll("Exception:", '');
}
