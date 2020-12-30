import 'package:flutter/material.dart';
import 'video.dart';

class MyVapp extends StatefulWidget {
  @override
  _MyVappState createState() => _MyVappState();
}

class _MyVappState extends State<MyVapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff1102d),
            title: Text("Video Player"),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.video_library),
                text: 'ASSETS',
              ),
              Tab(
                icon: Icon(Icons.web_asset),
                text: 'NETWORK',
              ),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  V2('assets/videos/intro.mp4'),
                ],
              ),
              ListView(
                children: <Widget>[
                  new V1(
                      'https://cdn.videvo.net/videvo_files/video/free/2012-07/small_watermarked/Countdown%20Timer_preview.webm'),
                  new V1(
                    "https://cdn.videvo.net/videvo_files/video/free/2014-12/small_watermarked/Raindrops_Videvo_preview.webm",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
