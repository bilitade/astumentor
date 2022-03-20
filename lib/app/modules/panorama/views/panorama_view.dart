import 'package:flutter/material.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/utils/grapheme_splitter.dart';
import 'package:panorama/panorama.dart';
import 'package:get/get.dart';
import './utils/hotspobutton.dart';

import '../controllers/panorama_controller.dart';

class PanoramaView extends GetView<PanoramaController> {
  const PanoramaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(child: Obx(() {
        if (controller.val.value == 0) {
          return Panorama(
            animSpeed: 1.0,
            hotspots: [
              Hotspot(
                latitude: -14.0,
                longitude: 0.0,
                width: 90,
                height: 75,
                widget: hotspotButton(
                    text: "Outside",
                    icon: Icons.open_in_browser,
                    onPressed: () => {controller.swap(1)}),
              ),
            ],
            child: Image.asset('assets/images/pano/pano1.jpg'),
          );
        } else if (controller.val.value == 1) {
          return Panorama(
            animSpeed: 1.0,
            hotspots: [
              Hotspot(
                latitude: -14.0,
                longitude: 0.0,
                width: 90,
                height: 75,
                widget: hotspotButton(
                    text: "inside",
                    icon: Icons.open_in_browser,
                    onPressed: () => {controller.swap(0)}),
              ),
              Hotspot(
                latitude: 14.0,
                longitude: 0.0,
                width: 90,
                height: 75,
                widget: hotspotButton(
                    text: "astu",
                    icon: Icons.open_in_browser,
                    onPressed: () => {controller.swap(5)}),
              ),
            ],
            child: Image.asset('assets/images/pano/pano2.jpg'),
          );
        } else if (controller.val.value == 2) {
          return Panorama(
            animSpeed: 1.0,
            hotspots: [
              Hotspot(
                latitude: -14.0,
                longitude: 0.0,
                width: 90,
                height: 75,
                widget: hotspotButton(
                    text: "inside",
                    icon: Icons.open_in_browser,
                    onPressed: () => {controller.swap(0)}),
              ),
              Hotspot(
                latitude: -14.0,
                longitude: 20,
                width: 90,
                height: 75,
                widget: hotspotButton(
                    text: "ASTU",
                    icon: Icons.open_in_browser,
                    onPressed: () => {controller.swap(5)}),
              ),
            ],
            child: Image.asset('assets/images/pano/pano2.jpg'),
          );
        } else if (controller.val.value == 3) {
          return Panorama(
            animSpeed: 1.0,
            hotspots: [
              Hotspot(
                latitude: -14.0,
                longitude: 0.0,
                width: 90,
                height: 75,
                widget: hotspotButton(
                    text: "inside",
                    icon: Icons.open_in_browser,
                    onPressed: () => {controller.swap(0)}),
              ),
            ],
            child: Image.asset('assets/images/pano/pano3.jpg'),
          );
        } else if (controller.val.value == 4) {
          return Panorama(
            animSpeed: 1.0,
            hotspots: [
              Hotspot(
                latitude: -14.0,
                longitude: 35,
                width: 90,
                height: 75,
                widget: hotspotButton(
                    text: "inside",
                    icon: Icons.open_in_browser,
                    onPressed: () => {controller.swap(0)}),
              ),
            ],
            child: Image.asset('assets/images/pano/pano4.jpg'),
          );
        } else if (controller.val.value == 5) {
          return Panorama(
            animSpeed: 1.0,
            hotspots: [
              Hotspot(
                latitude: -14.0,
                longitude: 15,
                width: 90,
                height: 75,
                widget: hotspotButton(
                    text: "building",
                    icon: Icons.open_in_browser,
                    onPressed: () => {controller.swap(2)}),
              ),
            ],
            child: Image.asset('assets/images/pano/pano5.jpg'),
          );
        } else {
          return const Text("");
        }
      })),
    );
  }
}
