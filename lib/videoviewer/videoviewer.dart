import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

import 'youtubeplayer.dart';

//https://github.com/GeekyAnts/flick-video-player

class SamplePlayer extends StatefulWidget {
  SamplePlayer({Key key}) : super(key: key);

  @override
  _SamplePlayerState createState() => _SamplePlayerState();
}

class _SamplePlayerState extends State<SamplePlayer> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network("http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4"),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          SizedBox(height:30,child: Text("Flick Video Player",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 200,
            child: FlickVideoPlayer(
                flickManager: flickManager
            ),
          ),
          SizedBox(height: 50,),
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new Youtubeplayer()));
            },
            child: Center(
              child: RaisedButton(
                child: Text("Youtube Video Player",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
