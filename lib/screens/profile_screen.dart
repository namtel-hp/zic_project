import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: ClippingClass(),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 3 / 12,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFFCA28), Color(0xffFFA726)],
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 120),
                child: ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 2 / 7,
                        width: MediaQuery.of(context).size.width - 30,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    "assets/home_images/user.png",
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                                Row(
                                  textDirection: TextDirection.ltr,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "Full Name: ",
                                        style: TextStyle(
                                          fontSize: 32,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Idrisa John",
                                        style: TextStyle(
                                          fontSize: 32,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Form(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: "Full name"),
                          ),
                          TextField(),
                          TextField(),
                          TextField(),
                        ],
                      ),
                    )
                  ],
                )),
            Positioned(
              right: 10,
              top: 20,
              height: 60,
              width: 60,
              child: IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                iconSize: 50,
                onPressed: () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var controlPoint = Offset(size.width - (size.width / 2), size.height - 80);
    var endPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
