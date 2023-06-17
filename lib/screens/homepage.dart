import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../global.dart';
import '../modals/videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Videos> videosList = [];

  lodeJasonBank() async {
    String jsonData =
        await rootBundle.loadString("assets/Data/videosList.json");

    List res = jsonDecode(jsonData);

    setState(() {
      videosList = res.map((e) => Videos.fromJSON(e)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lodeJasonBank();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
        centerTitle: true,
        backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: videosList.length,
          itemBuilder: (context, i) => Container(
            margin: const EdgeInsets.only(top: 15),
            child: InkWell(
              borderRadius: BorderRadius.circular(38),
              onTap: () {
                setState(() {
                  Global.res2 = videosList[i];
                });
                Navigator.of(context)
                    .pushNamed("all_videos_page", arguments: videosList[i]);
              },
              child: Column(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(38),
                        topLeft: Radius.circular(38),
                      ),
                      color: Colors.teal.withOpacity(0.25),
                      image: DecorationImage(
                        image: NetworkImage(videosList[i].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                      ),
                    ),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "- ${videosList[i].category}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
