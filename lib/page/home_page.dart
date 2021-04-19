import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app_stage/model/media_source.dart';
import 'package:flutter_app_stage/page/source_page.dart';
import 'package:flutter_app_stage/widget/video_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File fileMedia;
  MediaSource source;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: getPage(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.source),
              label: 'Source',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Edit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      );

  Widget getPage() {
    if (this.currentIndex == 0)
      return buildSourceWidget();
    else if (this.currentIndex == 1)
      return Center(child: Text("Edit"));
    else
      return Center(child: Text("Settings"));
  }


  Widget buildSourceWidget() => Scaffold(
          body: Center(
              child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 32, bottom: 80),
                          child: SizedBox(
                              child: fileMedia == null
                                  ? Icon(Icons.photo, size: 120)
                                  : VideoWidget(fileMedia))),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                            child: Text('Capture Video'),
                            onPressed: () => capture(MediaSource.video),
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                            )),
                      )
                    ],
                  ))));

  Future capture(MediaSource source) async {
    setState(() {
      this.fileMedia = null;
      this.source = source;
    });

    final result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SourcePage(),
        settings: RouteSettings(arguments: source)));

    if (result == null) {
      return;
    } else {
      setState(() {
        fileMedia = result;
      });
    }
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
