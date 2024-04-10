import 'package:flutter/material.dart';
import 'package:video_record_player/screen/video_screen_view.dart';
import 'package:video_record_player/start_video_btn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:StartVideoBtn(),
    );
  }
}

