import 'package:flutter/material.dart';

import '../utils/widgets/comment_card.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Comments'),
      ),
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: 20,
          ),
          padding: EdgeInsets.only(left: 20, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.ytimg.com/vi/TR9u4k__v6g/maxresdefault.jpg'),
                radius: 20,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'comment as username',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child:
                      Text('Post', style: TextStyle(color: Colors.blueAccent)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
