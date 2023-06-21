import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:youtube_app/Global/youtube_global.dart';

class Home_Page extends StatefulWidget {

  @override
  _Home_PageState createState() => _Home_PageState();
}
class _Home_PageState extends State<Home_Page> {

  bool typing = false;
  static String key = "AIzaSyBRVa7iu7N03OuNEqZKHQGK1au-zbeRwZw";
  String header = "New Song";

  YoutubeAPI youtube = YoutubeAPI(key);
  List<YouTubeVideo> videoResult = [];


  Future<void> callAPI() async {
    videoResult = await youtube.search(
      "New Song",
      order: 'relevance',
      videoDuration: 'any',
    );
    videoResult = await youtube.nextPage();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
        children:  const [
        Icon(
        Icons.play_circle_filled,
        color: Colors.red,
        size: 30,
    ),
          SizedBox(width: 5),
          Text(
            "YouTube",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
    ]
      ),
        actions: [
          const Icon(
            Icons.cast,
            color: Colors.black,
            size: 23,
          ),
          const SizedBox(width: 12),
          const Icon(
            Icons.notifications_none_outlined,
            color: Colors.black,
            size: 27,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("search_page");
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: const AssetImage('assets/images/img_1.png'),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
                children: videoResult.map<Widget>(listItem).toList(),
              )
          )
        ],
      )
    );
  }

  Widget listItem(YouTubeVideo video) {
    return GestureDetector(
      onTap: () {
        Global.data = video;
        Global.id = video.id.toString();
        Navigator.of(context).pushNamed("player_page");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              image: DecorationImage(
                image: NetworkImage("${video.thumbnail.high.url}"),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Padding(
            padding:
            const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  video.channelTitle,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

