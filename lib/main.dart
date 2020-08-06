import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:zic_project/screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZIC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Nunito",
      ),
      home: MyHomePage(title: 'ZIC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageState = 0;
  var _backGroundColor = Colors.white;
  var _textColor = Color(0xFFB052C7B);
  double _marginTop = 100;
  double deviceWidth = 0;
  double deviceHeight = 0;

  double _loginYOffSet = 0;
  double _loginXOffSet = 0;
  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _registerYOffSet = 0;
  double _registerHeight = 0;
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    _loginHeight = deviceHeight - 270;
    _registerHeight = deviceHeight - 270;

    switch (_pageState) {
      case 0:
        _backGroundColor = Color(0xFFB052C7B);
        _textColor = Colors.white;
        _marginTop = 90;

        _loginWidth = deviceWidth;
        _loginYOffSet = deviceHeight;
        _loginXOffSet = 0;
        _loginOpacity = 1;
        _loginHeight = _keyboardVisible ? deviceHeight : deviceHeight - 270;

        _registerYOffSet = deviceHeight;
        break;
      case 1:
        _backGroundColor = Color(0xFFFFC107);
        _textColor = Colors.white;
        _marginTop = 80;

        _loginWidth = deviceWidth;
        _loginYOffSet = _keyboardVisible ? 40 : 270;
        _loginXOffSet = 0;
        _loginOpacity = 1;

        _registerYOffSet = deviceHeight;
        break;
      case 2:
        _backGroundColor = Color(0xFFFFC107);
        _textColor = Colors.white;
        _marginTop = 70;

        _loginWidth = deviceWidth - 40;
        _loginYOffSet = _keyboardVisible ? 30 : 240;
        _loginXOffSet = 20;
        _loginOpacity = 0.7;

        _registerYOffSet = _keyboardVisible ? 55 : 270;
        _registerHeight = _keyboardVisible ? deviceHeight : deviceHeight - 240;
        break;
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              color: _backGroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 0;
                      });
                    },
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: _marginTop),
                            child: Text(
                              "Zanzibar Insurance Corporation",
                              style: TextStyle(color: _textColor, fontSize: 18),
                            )),
                        Container(
                          margin: EdgeInsets.all(22),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Welcome to ZIC mobile application.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: _textColor, fontSize: 16),
                          ),
                        ),
                      ],
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Center(
                      child: Image.asset('assets/images/ZIC.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_pageState != 0) {
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    child: Container(
                      child: Container(
                        margin: EdgeInsets.all(22),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFCA28),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _pageState = 2;
                });
              },
              child: AnimatedContainer(
                padding: EdgeInsets.all(32),
                width: _loginWidth,
                height: _loginHeight,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1000),
                transform:
                    Matrix4.translationValues(_loginXOffSet, _loginYOffSet, 1),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(_loginOpacity),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Login To Continue",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        IconInput(
                          icon: Icons.email,
                          txtHint: "Enter Email...!",
                        ),
                        SizedBox(height: 20),
                        IconInput(
                          icon: Icons.vpn_key,
                          txtHint: "Enter Password",
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        PrimaryButton(btnText: "Login"),
                        SizedBox(height: 20),
                        ButtonOutLine(btnText: "Create New Account"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _pageState = 1;
                });
              },
              child: AnimatedContainer(
                height: _registerHeight,
                padding: EdgeInsets.all(32),
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1000),
                transform: Matrix4.translationValues(0, _registerYOffSet, 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Create a New Account",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        IconInput(
                          icon: Icons.email,
                          txtHint: "Enter Email...!",
                        ),
                        SizedBox(height: 20),
                        IconInput(
                          icon: Icons.vpn_key,
                          txtHint: "Enter Password",
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ));
                          },
                          child: PrimaryButton(btnText: "Create Acount"),
                        ),
                        SizedBox(height: 20),
                        ButtonOutLine(btnText: "Back To Login"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class IconInput extends StatefulWidget {
  final IconData icon;
  final String txtHint;
  IconInput({Key key, this.txtHint, this.icon}) : super(key: key);

  @override
  _IconInputState createState() => _IconInputState();
}

class _IconInputState extends State<IconInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFBC7C7C7),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Color(0xFFBB9B9B9),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: widget.txtHint,
                ),
              ),
            )
          ],
        ));
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({Key key, this.btnText}) : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFCA28),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(20),
      child: Center(
          child: Text(
        widget.btnText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      )),
    );
  }
}

class ButtonOutLine extends StatefulWidget {
  final String btnText;
  ButtonOutLine({Key key, this.btnText}) : super(key: key);

  @override
  _ButtonOutLineState createState() => _ButtonOutLineState();
}

class _ButtonOutLineState extends State<ButtonOutLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFFFCA28),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(20),
      child: Center(
          child: Text(
        widget.btnText,
        style: TextStyle(
          color: Color(0xFFFFCA28),
          fontSize: 16,
        ),
      )),
    );
  }
}
