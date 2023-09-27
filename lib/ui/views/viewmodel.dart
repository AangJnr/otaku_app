import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:otaku_katarougu_app/app/app.dialogs.dart';
import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/app/app.logger.dart';
import 'package:otaku_katarougu_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/theme_setup.dart';
import '../../domain/model/profile/profile.dart';
import '../../domain/repository/user_repository.dart';
import '../../main.dart';

enum Social { WhatsApp, Instagram, LinkedIn, Twitter, Facebook, Email, Phone }

class ViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _dialogService = locator<DialogService>();
  Profile _profile = const Profile();
  Profile get profile => _profile;
  String _image = '';
  String get bannerImage => _image;
  bool get hasImage => _image.isNotEmpty;
  RouterService get routerService => _routerService;
  AppTheme get appTheme => _profile.category.theme ?? MainApp.appTheme;

  void init({String? key, Profile? profile}) async {
    final listOfAssets = await getAssetPaths();
    _image = listOfAssets[Random().nextInt(listOfAssets.length)];

    final key = Uri.base.queryParameters['key'] ?? "";

    getLogger('ProfileViewModel').e(profile.toString());
    profile ??= await runBusyFuture(locator<UserRepository>().getProfile(key));
    if (profile == null) {
      _routerService.replaceWith(const SubscriptionViewRoute());
    }
    _profile = profile!;

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

  launchWhatsApp(String number) {
    final Uri uri = Uri(
      scheme: 'https',
      path: '${getLinkPrefix(Social.WhatsApp)}${number.replaceFirst('+', '')}',
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

  launchInstagram(String uid) {
    final Uri uri = Uri(
      scheme: 'https',
      path: '${getLinkPrefix(Social.Instagram)}$uid',
    );
    _launch(uri);
  }

  launchFacebook(String uid) {
    final Uri uri = Uri(
      scheme: 'https',
      path: '${getLinkPrefix(Social.Facebook)}$uid',
    );
    _launch(uri);
  }

  launchLinkedIn(String uid) {
    final Uri uri = Uri(
      scheme: 'https',
      path: '${getLinkPrefix(Social.LinkedIn)}$uid',
    );
    _launch(uri);
  }

  launchTwitter(String uid) {
    final Uri uri = Uri(
      scheme: 'https',
      path: '${getLinkPrefix(Social.Twitter)}$uid',
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

  void goToSubscriptionScreen() {
    _routerService.navigateTo(const SubscriptionViewRoute());
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
        variant: DialogType.subscriptionAlert,
        title: title,
        description: description,
        secondaryButtonTitle: negativeButtonTitle,
        mainButtonTitle: positiveButtonTitle,
        data: data);
  }
}
