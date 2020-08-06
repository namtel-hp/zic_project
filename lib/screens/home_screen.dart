import 'package:flutter/material.dart';
import 'package:zic_project/modals/service_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> serviceList = [];
  Widget _listService() {
    final orientation = MediaQuery.of(context).orientation;
    return Expanded(
      child: GridView.builder(
        itemCount: serviceList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        itemBuilder: (context, index) {
          return serviceList[index];
        },
      ),
    );
  }

  void getPostedServicet() {
    List<dynamic> respodedList = SERVICE_DATA;
    List<Widget> listItems = [];
    respodedList.forEach((service) {
      listItems.add(
        GestureDetector(
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => Detailes()));
            print(service["name"]);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: _customCard(
              // imageUrl: "nyumba_kuwaka_moto.png",
              imageUrl: service["image"],
              // item: "Bima ya Moto",
              item: service["name"],
            ),
          ),
        ),
      );
    });

    setState(() {
      serviceList = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostedServicet();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 220, bottom: 52),
              child: _listService(),
            ),
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

  _customCard({String imageUrl, String item}) {
    return SizedBox(
      height: 148,
      width: 230,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/home_images/" + imageUrl),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
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
