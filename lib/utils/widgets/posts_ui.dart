import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

class PostUI extends StatefulWidget {
  final snap;
  const PostUI({Key? key, required this.snap}) : super(key: key);

  @override
  State<PostUI> createState() => _PostUIState();
}

class _PostUIState extends State<PostUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(widget.snap['profImage']),
              ),
              title: Text(widget.snap['username']),
              subtitle: Text(
                DateFormat.yMd().format(
                  widget.snap['datePublish'].toDate(),
                ),
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .33,
              width: double.infinity,
              child: Image.network(
                widget.snap['postUrl'],
                fit: BoxFit.cover,
              ),
            ),
            ButtonBar(
              buttonPadding: EdgeInsets.all(1),
              alignment: MainAxisAlignment.start,
              children: [
                //TextButton(
                //onPressed: () {
                // Perform some action
                //},
                //child: Icon(LineIcons.heart),
                // ),
                //TextButton(
                //onPressed: () {
                // Navigator.of(context).push(
                //  MaterialPageRoute(builder: (context) => Comments()));
                // },
                //child: Icon(LineIcons.comment),
                // ),
                TextButton(
                  onPressed: () {
                    // Perform some action
                  },
                  child: Icon(LineIcons.share),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.snap['description'],
                style: TextStyle(color: Colors.white.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
