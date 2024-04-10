import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_record_player/screen/video_screen_view.dart';
class StartVideoBtn extends StatefulWidget {
  const StartVideoBtn({super.key});

  @override
  State<StartVideoBtn> createState() => _StartVideoBtnState();
}

class _StartVideoBtnState extends State<StartVideoBtn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Start Video'),
      ),
      body: Center(
        child: ElevatedButton (
          onPressed:  () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyVideoPlayer()),
            );
          },
          child: Text("Video Start"),
        ),
      ),
    );
  }
}
