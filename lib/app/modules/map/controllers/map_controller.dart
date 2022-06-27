import 'dart:typed_data';

import 'package:get/get.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  // import 'package:location/location.dart';
  // RxList markers = [].obs;
  RxList<Marker> markers = (List<Marker>.of([])).obs;

  Future<Uint8List?> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  assign() async {
    final Uint8List? gateIcon =
        await getBytesFromAssets('assets/markers/gate.png', 50);
    final Uint8List? loungeIcon =
        await getBytesFromAssets('assets/markers/lounge.png', 50);
    final Uint8List? restaurantIcon =
        await getBytesFromAssets('assets/markers/restaruant.png', 50);
    final Uint8List? stadiumIcon =
        await getBytesFromAssets('assets/markers/stadium.png', 50);
    final Uint8List? buildingIcon =
        await getBytesFromAssets('assets/markers/building.png', 50);
    final Uint8List? hallIcon =
        await getBytesFromAssets('assets/markers/hall.png', 50);
  final Uint8List? libraryIcon =
        await getBytesFromAssets('assets/markers/library.png', 50);
  final Uint8List?  clinicIcon =
        await getBytesFromAssets('assets/markers/clinic.png', 50);
final Uint8List?  cafeIcon =
        await getBytesFromAssets('assets/markers/cafe.png', 50);

    markers.add(
      Marker(
          markerId: const MarkerId('qulubi'),
          position: const LatLng(8.567178289149949, 39.29547534774895),
          icon: BitmapDescriptor.fromBytes(gateIcon!),
          infoWindow: const InfoWindow(title: 'Qulubi Gate')),
    );

    markers.add(
      Marker(
          markerId: const MarkerId('main'),
          position: const LatLng(8.559132776559096, 39.28573195896119),
          icon: BitmapDescriptor.fromBytes(gateIcon),
          infoWindow: const InfoWindow(title: 'Main Gate')),
    );
    markers.add(
      Marker(
          markerId: const MarkerId('oda'),
          position: const LatLng(8.557047557395144, 39.290960004621724),
          icon: BitmapDescriptor.fromBytes(gateIcon),
          infoWindow: const InfoWindow(title: 'Geda Gate')),
    );

    markers.add(
      Marker(
          markerId: const MarkerId('admin'),
          position: const LatLng(8.561243511220374, 39.29023112189616),
          icon: BitmapDescriptor.fromBytes(buildingIcon!),
          infoWindow: const InfoWindow(title: 'Admin Building')),
    );
     markers.add(
      Marker(
          markerId: const MarkerId('hall'),
          position: const LatLng(8.564502068836134, 39.291255657701086),
          icon: BitmapDescriptor.fromBytes(hallIcon!),
          infoWindow: const InfoWindow(title: 'ODA Nabe Hall')),
    );
markers.add(
      Marker(
          markerId: const MarkerId('lounge'),
          position: const LatLng(8.564730390888725, 39.29135575329343),
          icon: BitmapDescriptor.fromBytes(loungeIcon!),
          infoWindow: const InfoWindow(title: 'Anfi lounge')),
    );

    markers.add(
      Marker(
          markerId: const MarkerId('lounge2'),
          position: const LatLng(8.564261010620742, 39.28983059649206),
          icon: BitmapDescriptor.fromBytes(loungeIcon),
          infoWindow: const InfoWindow(title: 'Mestawet Lounge')),
    );

 markers.add(
      Marker(
          markerId: const MarkerId('cafe'),
          position: const LatLng(8.565730142668087, 39.290553436663636),
          icon: BitmapDescriptor.fromBytes(cafeIcon!),
          infoWindow: const InfoWindow(title: 'Student cafe')),
    );


markers.add(
      Marker(
          markerId: const MarkerId('stadium'),
          position: const LatLng(8.564543040229156, 39.29467043069526),
          icon: BitmapDescriptor.fromBytes(stadiumIcon!),
          infoWindow: const InfoWindow(title: 'Stadium')),
    );


markers.add(
      Marker(
          markerId: const MarkerId('basketball'),
          position: const LatLng(8.565074961134522, 39.293348684480264),
          icon: BitmapDescriptor.fromBytes(stadiumIcon),
          infoWindow: const InfoWindow(title: 'Basketball Field')),
    );

markers.add(
      Marker(
          markerId: const MarkerId('centeral'),
          position: const LatLng(8.561087650422746, 39.291377780882556),
          icon: BitmapDescriptor.fromBytes(buildingIcon ),
          infoWindow: const InfoWindow(title: 'Central Library')),
    );

markers.add(
      Marker(
          markerId: const MarkerId('applied'),
          position: const LatLng(8.562549151579711, 39.287718875309885),
          icon: BitmapDescriptor.fromBytes(buildingIcon ),
          infoWindow: const InfoWindow(title: 'Applied Science Library')),
    );

markers.add(
      Marker(
          markerId: const MarkerId('female'),
          position: const LatLng(8.563420238656816, 39.29205557704521),
          icon: BitmapDescriptor.fromBytes(buildingIcon ),
          infoWindow: const InfoWindow(title: 'Female Library')),
    );


   markers.add(
      Marker(
          markerId: const MarkerId('clinic'),
          position: const LatLng(8.562664513589413, 39.29324082951653),
          icon: BitmapDescriptor.fromBytes(clinicIcon! ),
          infoWindow: const InfoWindow(title: 'Clinic')),
    ); 




  }

  Completer<GoogleMapController> Mcontroller = Completer();

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(8.557018955696472, 39.29101573928365),
    zoom: 17.151926040649414,
  );

  @override
  void onInit() async {
    await assign();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
