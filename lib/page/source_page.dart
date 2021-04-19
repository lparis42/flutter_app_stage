import 'package:flutter/material.dart';
import 'package:flutter_app_stage/widget/camera_button_widget.dart';
import 'package:flutter_app_stage/widget/gallery_button_widget.dart';

class SourcePage extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    body: ListView(children: [
        CameraButtonWidget(),
        GalleryButtonWidget(),
      ],
    ),
  );
}