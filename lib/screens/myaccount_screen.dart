import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            // Container(
            //   margin: EdgeInsets.only(top: 220),
            //   child: _listService(),
            // ),
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
            Positioned(
              left: 20,
              top: 10,
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/home_images/user.png"),
              ),
            ),
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
            Positioned(
              left: 20,
              top: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Hi John",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      )),
                  Text("Welcome back to ZIC mobile application.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ],
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
