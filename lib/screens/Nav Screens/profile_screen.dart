import 'package:flutter/material.dart';
import 'package:itesogram/models/user.dart' as model;
import 'package:itesogram/utils/others/colors.dart';
import 'package:itesogram/utils/widgets/follow_button.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';
import '../../utils/widgets/bottomNavigationBar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 3;
  List fotos = [
    {
      "name": "Foto1",
      "image": "https://i.ytimg.com/vi/TR9u4k__v6g/maxresdefault.jpg"
    },
    {
      "name": "Foto2",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsCTHzmFNbMTPZSW-pGyKUofii0l0olswRMTyBJg1TooAsNAEafoi-eAfSrZla3Oap8ic&usqp=CAU"
    }
  ];

  @override
  Widget build(BuildContext context) {
    model.User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
        backgroundColor: itesoColor,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://pbs.twimg.com/media/EaKjLaFXkAAbtPs.png"),
                        radius: 40,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "0",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Post",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "0",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Seguidores",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "0",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Seguidos",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FollowButton(
                                  fondo: blueColor,
                                  borde: primaryColor,
                                  seguido: "Editar Perfil",
                                  colorSeguido: primaryColor,
                                  funcion: () {},
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "user_name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 1),
                    child: Text(
                      "descripción",
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(0),
                  child: Image(
                    image: NetworkImage(
                      fotos[0]["image"],
                    ),
                    width: 150,
                    height: 150,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: Image(
                    image: NetworkImage(
                      fotos[1]["image"],
                    ),
                    width: 150,
                    height: 150,
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBarIteso(
          selectedIndex: selectedIndex,
        ));
  }
}
