import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../models/story_model.dart';


class FeedPage extends StatefulWidget {
  static const id = "feed_page";

  const FeedPage({Key? key}) : super(key: key);
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<Story> _stories = [
    Story("assets/images/img.png", "Jazmin"),
    Story("assets/images/img_1.png", "Sylvester"),
    Story("assets/images/img_2.png", "Lavina"),
    Story("assets/images/img_3.png", "Jazmin"),
    Story("assets/images/img_4.png", "Sylvester"),
    Story("assets/images/img_5.png", "Lavina"),
  ];

  final List<Post> _posts = [
    Post(
        username: "Brianne",
        userImage: "assets/images/img.png",
        postImage: "assets/images/img.png",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Henri",
        userImage: "assets/images/img.png",
        postImage: "assets/images/img.png",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Mariano",
        userImage: "assets/images/img.png",
        postImage: "assets/images/img.png",
        caption: "Consequatur nihil aliquid omnis consequatur."),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: Colors.white,
            ),
            // #stories #watchall
            Container(
              color: Colors.black,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Stories",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Watch All",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // #storylist
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _stories.map((story) {
                  return _itemOfStory(story);
                }).toList(),
              ),
            ),

            // #postlist
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i) {
                    return _itemOfPost(_posts[i]);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: const Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(
              2,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(story.name, style: const TextStyle(
          color: Colors.grey
        ),),
      ],
    );
  }

  Widget _itemOfPost(Post post) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(post.username, style: TextStyle(
                      color: Colors.white
                    ),),
                  ],
                ),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          FadeInImage(
            image: AssetImage(post.postImage),
            placeholder: const AssetImage("assets/images/img.png"),
            width: MediaQuery.of(context).size.width,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(Icons.comment_outlined),
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
              IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.bookmark),
              ),
            ],
          ),

          // #tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: "Sigmund,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " Yessenia,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " Dayana",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: " 1263 others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // #caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 5,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.username,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: " ${post.caption}",
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          // #post date
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            alignment: Alignment.topLeft,
            child: const Text(
              "February 2020",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}