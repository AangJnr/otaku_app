// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../app/services/location_service.dart';
import '../../../app/services/toast_service.dart';
import 'dart:ui' as ui;

const SOURCE_ID = "srcId";
const DRIVER_ID = "driverId";
const DESTINATION_ID = "destId";
const KEY = 'AIzaSyC1Q7EaLBqzrldfVay8HDAVS2v9R1r88KY';

class MapViewModel extends BaseViewModel {
  final LocationService _locationService = locator<LocationService>();
  final ToastService _toastService = locator<ToastService>();
  GoogleMapController? _controller;
  String _mapStyle = '';
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  CameraPosition _currentCameraPosition = const CameraPosition(
    target: LatLng(0.0, -0.0),
    zoom: 18.0,
  );
  LatLng _currentDriverLocation = const LatLng(0.0, -0.0);
  LatLng _previousDriverLocation = const LatLng(0.0, -0.0);

  LatLng _destLatLng = const LatLng(0.0, -0.0);
  BitmapDescriptor? _destinationIcon;
  BitmapDescriptor? _pickupIcon;
  BitmapDescriptor? _driverIcon;

  bool _isNavigation = true;
  final Completer<GoogleMapController> _completerController = Completer();
  CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
  //getters
  ToastService get toastService => _toastService;
  LocationService get locationService => _locationService;
  CameraPosition get cameraPosition => _currentCameraPosition;
  Set<Marker> get markers => _markers;
  Set<Polyline> get polylines => _polylines;
  String get mapStyle => _mapStyle;

  CameraTargetBounds get cameraTargetBounds => _cameraTargetBounds;

  void generateRoute({
    required BuildContext context,
    required GoogleMapController controller,
  }) async {
    _controller = controller;
    _completerController.complete(controller);

    _mapStyle = await rootBundle.loadString('assets/map_style.txt');
    controller.setMapStyle(mapStyle);

    _pickupIcon ??= await getBytesFromAsset('assets/pickup_icon_48.png');
    _destinationIcon ??=
        await getBytesFromAsset('assets/destination_icon_48.png');
    _driverIcon ??= await getBytesFromAsset('assets/rider_icon_48.png');
  }

  void removeLocationListener() {
    locationService.dispose();
  }

  void addMarker(LatLng pinPosition, BitmapDescriptor icon, id) {
    _markers.add(Marker(
        markerId: MarkerId('$id'),
        rotation: 0.0,
        position: pinPosition,
        visible: true,
        anchor: const Offset(0.5, 0.6),
        flat: false,
        zIndex: 5,
        icon: icon // updated position
        ));

    rebuildUi();
  }


  static LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double x0 = 0.0, x1 = 0.0, y0 = 0.0, y1 = 0.0;
    for (LatLng latLng in list) {
      if (x0 == 0.0) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1) y1 = latLng.longitude;
        if (latLng.longitude < y0) y0 = latLng.longitude;
      }
    }

    return LatLngBounds(northeast: LatLng(x1, y1), southwest: LatLng(x0, y0));
  }

  Future<BitmapDescriptor> getBytesFromAsset(String path,
      {int width = 40}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    final icon = (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
    return BitmapDescriptor.fromBytes(icon);
  }
}
