import 'package:flutter/material.dart';
import 'package:nlvideoplayer/screens/video_page.dart';
import 'package:nlvideoplayer/screens/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const HomePage(),
      "all_videos_page": (context) => const AllVideosPage(),
    },
  ));
}
