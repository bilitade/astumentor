import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        child: Obx(
          () => GoogleMap(
              mapType: MapType.satellite,
              zoomControlsEnabled: true,
              buildingsEnabled: true,
              indoorViewEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              mapToolbarEnabled: true,
              markers: Set<Marker>.of(controller.markers.value),
              initialCameraPosition: controller.kGooglePlex,
              onMapCreated: (GoogleMapController Lcontroller) {
                controller.Mcontroller.complete(Lcontroller);
              }),
        ),
      ),

      //   appBar: AppBar(
      //     title: Text('MapView'),
      //     centerTitle: true,
      //   ),

      // body: Container(
      //     height: MediaQuery.of(context).size.height,
      //     width: MediaQuery.of(context).size.width,
      //     child:GoogleMap(
      //       zoomControlsEnabled: false,
      //       myLocationButtonEnabled: true,
      //       myLocationEnabled: true,

      //       mapType:MapType.satellite,

      //       initialCameraPosition:const CameraPosition(
      //         target: LatLng(8.559287181252982, 39.28565907670999),
      //         zoom: 18.0,
      //       ),
      //       onMapCreated: (GoogleMapController LController){
      //         controller.Mcontroller = LController;
      //       },

      //       markers:  controller.markers,
      //     ) ,
      //   ),
      //   floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.location_searching,color: Colors.white,),
      //     onPressed: (){
      //      controller. getLocation();
      //     },
      //   ),
    );
  }
}
