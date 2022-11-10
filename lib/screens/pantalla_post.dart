import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itesogram/logic/firestore_methods.dart';
import 'package:itesogram/models/user.dart';
import 'package:itesogram/provider/user_provider.dart';
import 'package:itesogram/screens/home.dart';
import 'package:itesogram/screens/likes.dart';
import 'package:itesogram/utils/colors.dart';
import 'package:itesogram/utils/utils.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class PantallaPost extends StatefulWidget {
  const PantallaPost({super.key});

  @override
  State<PantallaPost> createState() => _PantallaPostState();
}

class _PantallaPostState extends State<PantallaPost> {
  bool _isloading = false;
  Uint8List? _file;
  final TextEditingController _descController = TextEditingController();

  void postImage(
    String uid,
    String username,
    String profileImage,
  ) async {
    setState(() {
      _isloading = true;
    });
    try {
      //use firebase method to send data from users post
      String errorMessage = await FireStoreMethods().uploadPost(
          _descController.text, _file!, uid, username, profileImage);

      if (errorMessage == 'Uploaded with success') {
        setState(() {
          _isloading = false;
        });

        showSnackBar('Post uploaded succesfully', context);
        //clean screen if success
        clean();
      } else {
        setState(() {
          _isloading = false;
        });
        showSnackBar(errorMessage, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  _seleccionarImg(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: itesoColor,
            title: Text("Nueva publicación"),
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SimpleDialogOption(
                  child: Text("Tomar una foto"),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    Uint8List file = await pickImage(
                      ImageSource.camera,
                    );
                    setState(() {
                      _file = file;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SimpleDialogOption(
                  child: Text("Escoge desde la galeria"),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    Uint8List file = await pickImage(
                      ImageSource.gallery,
                    );
                    setState(() {
                      _file = file;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SimpleDialogOption(
                  child: Center(
                      child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.redAccent),
                  )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });
  }

  int _selectedIndex = 2;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Post',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  void clean() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return _file == null
        ? Scaffold(
            body: Center(
              child: IconButton(
                icon: Icon(Icons.upload),
                onPressed: () {
                  _seleccionarImg(context);
                },
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: itesoColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: clean,
              ),
              title: _widgetOptions.elementAt(_selectedIndex),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: () =>
                      postImage(user.uid, user.username, user.photoUrl),
                  child: Text(
                    "Publicar",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                _isloading ? LinearProgressIndicator() : Container(),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoUrl),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: TextField(
                        controller: _descController,
                        decoration: InputDecoration(
                          hintText: "Escribe una descripción",
                          border: InputBorder.none,
                        ),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: MemoryImage(_file!),
                                    fit: BoxFit.fill,
                                    alignment: FractionalOffset.topCenter))),
                      ),
                    ),
                    Divider(),
                  ],
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(),
          );
  }

  Container BottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Posts()),
                  );
                },
              ),
              GButton(
                icon: LineIcons.heart,
                text: 'Likes',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Likes()),
                  );
                },
              ),
              GButton(
                icon: LineIcons.plusCircle,
                text: 'Post',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
                onPressed: () {},
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
