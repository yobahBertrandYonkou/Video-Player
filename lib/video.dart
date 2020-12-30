import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class V1 extends StatefulWidget {
  var url;
  V1(url) {
    this.url = url;
  }
  @override
  _V1State createState() => _V1State(url);
}

class _V1State extends State<V1> {
  VideoPlayerController _controller;
  var url;
  _V1State(url) {
    this.url = url;
  }
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff112ed),
      child: Column(
        children: <Widget>[
          Center(
            child: _controller.value.initialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(
                    height: 100,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "Loading...",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
          ),
          VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: Colors.red,
              backgroundColor: Colors.brown,
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                    if (!_controller.value.isPlaying) {
                      _controller.initialize();
                    }
                  });
                },
                iconSize: 35,
                icon: Icon(
                  _controller.value.isPlaying
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isLooping
                        ? _controller.setLooping(false)
                        : _controller.setLooping(true);
                  });
                },
                color:
                    _controller.value.isLooping ? Colors.white : Colors.black,
                iconSize: 35,
                icon: Icon(
                  Icons.loop,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _controller.seekTo(
                      Duration(
                        days: 0,
                        minutes: 0,
                        seconds: 0,
                        hours: 0,
                        milliseconds: 0,
                      ),
                    );
                    _controller.pause();
                  });
                },
                iconSize: 35,
                icon: Icon(
                  Icons.stop,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class V2 extends StatefulWidget {
  var path;
  V2(path) {
    this.path = path;
  }

  @override
  _V2State createState() => _V2State(path);
}

class _V2State extends State<V2> {
  VideoPlayerController _controller;
  var path;

  _V2State(path) {
    this.path = path;
  }
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      path,
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff112ed),
      child: Column(
        children: <Widget>[
          Center(
            child: _controller.value.initialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(
                    height: 100,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "Loading...",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
          ),
          VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: Colors.red,
              backgroundColor: Colors.brown,
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();

                    if (!_controller.value.isPlaying) {
                      _controller.initialize();
                    }
                  });
                },
                iconSize: 35,
                icon: Icon(
                  _controller.value.isPlaying
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isLooping
                        ? _controller.setLooping(false)
                        : _controller.setLooping(true);
                  });
                },
                color:
                    _controller.value.isLooping ? Colors.white : Colors.black,
                iconSize: 35,
                icon: Icon(
                  Icons.loop,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _controller.seekTo(
                      Duration(
                        days: 0,
                        minutes: 0,
                        seconds: 0,
                        hours: 0,
                        milliseconds: 0,
                      ),
                    );
                    _controller.pause();
                  });
                },
                iconSize: 35,
                icon: Icon(
                  Icons.stop,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
