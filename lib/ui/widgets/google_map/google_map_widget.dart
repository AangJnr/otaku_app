import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'google_map_viewmodel.dart';

class AGoogleMap extends StackedView<MapViewModel> {
  const AGoogleMap({Key? key}) : super(key: key);
  @override
  Widget builder(BuildContext context, MapViewModel viewModel, Widget? child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GoogleMap(
        compassEnabled: false,
        myLocationEnabled: false,
        mapToolbarEnabled: false,
        zoomGesturesEnabled: true,
        markers: viewModel.markers,
        polylines: viewModel.polylines,
        onMapCreated: (GoogleMapController controller) {
          viewModel.generateRoute(
            context: context,
            controller: controller,
          );
        },
        myLocationButtonEnabled: false,
        initialCameraPosition: viewModel.cameraPosition,
      ),
    );
  }

  @override
  void onViewModelReady(MapViewModel viewModel) {
    super.onViewModelReady(viewModel);
  }

  @override
  MapViewModel viewModelBuilder(BuildContext context) => MapViewModel();
}
