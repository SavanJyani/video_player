import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import '../start_video_btn.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({Key? key}) : super(key: key);

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  FlickManager? flickManager;
  VideoPlayerController? videoPlayerController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset("assets/images/4872899-hd_1920_1080_25fps.mp4");
    flickManager = FlickManager(videoPlayerController: videoPlayerController!);

    videoPlayerController?.initialize().then((_) {
      setState(() {});
    });

    videoPlayerController?.addListener(() {
      setState(() {});
      if (videoPlayerController!.value.position >= videoPlayerController!.value.duration) {
        // Video play completed over
        _navigateToStartVideoBtnScreen();
      }
    });
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    flickManager?.dispose();
    super.dispose();
  }

  void _navigateToStartVideoBtnScreen() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Video Player"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(
                  child: CircularProgressIndicator(
                    value:
                        ((videoPlayerController?.value.position.inMilliseconds ?? 0) / (videoPlayerController?.value.duration.inMilliseconds ?? 0)),
                    backgroundColor: Colors.grey.shade400,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      ((videoPlayerController?.value.duration.inSeconds ?? 0) - (videoPlayerController?.value.position.inSeconds ?? 0))
                          .toString()
                          .split('.')
                          .first,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: FlickVideoPlayer(
                flickManager: flickManager!,
                flickVideoWithControls: const FlickVideoWithControls(),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                value:
                    1.0 - ((videoPlayerController?.value.position.inMilliseconds ?? 0) / (videoPlayerController?.value.duration.inMilliseconds ?? 0)),
                minHeight: 5,
                backgroundColor: Colors.grey,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
