import 'dart:async';
import 'dart:io';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app.locator.dart';
import 'toast_service.dart';

class LocationService {
  int _intervalInSeconds = 20;

  StreamSubscription<Position>? _positionStream;
  late LocationPermission permission;

  void setLocationListener(
      {Function(Position locationData)? onUpdated,
      String? uid,
      int updateIntervalInSeconds = 20}) async {
    dispose();
    await _checkLocationPermissions();

    _intervalInSeconds = updateIntervalInSeconds;

    _positionStream = Geolocator.getPositionStream(
      locationSettings: _getSettings(),
    ).listen((Position position) async {
      print("Bearing => ${position.heading}");
      print('${position.latitude},${position.longitude}');
      print("Update interval => $_intervalInSeconds");

      onUpdated?.call(position);
    });
  }

  Future<Position?> getLastKnownLocation() async {
    _checkLocationPermissions();
    return Geolocator.getLastKnownPosition();
  }

  Future<Position> getCurrentLocation() async {
    await _checkLocationPermissions();
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  void dispose() async {
    _positionStream?.cancel();
  }

  Future<String> getAddressName(lat, lng) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lng);
    return Future.value(placemark[0].name ?? "N/A");
  }

  LocationSettings _getSettings() {
    if (Platform.isAndroid) {
      return AndroidSettings(
          accuracy: LocationAccuracy.high,
          intervalDuration: Duration(seconds: _intervalInSeconds),
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText:
                "Contena location service will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          ));
    }
    if (Platform.isAndroid) {
      return AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    }
    return LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
  }

  _checkLocationPermissions() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locator<ToastService>().showToast('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      locator<ToastService>().showToast(
          'Location permissions are permantly denied, we cannot request permissions. Please provide location permission in the settings app.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        await locator<DialogService>()
            .showConfirmationDialog(
                title: 'Location services required',
                description:
                    'Contena requires $permission to be able to provide timely deliveries around you. Please provide location permissions.',
                barrierDismissible: false,
                cancelTitle: 'Cancel',
                confirmationTitle: 'OK')
            .then((value) {
          if (value?.confirmed == true) {
            _checkLocationPermissions();
          }
        });
      }
    }

    return permission;
  }
}
