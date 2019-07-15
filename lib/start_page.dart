import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class StartPage extends StatefulWidget {
  static String tag = 'start-page';
  @override
  _StartPageState createState() => new _StartPageState(); 
}

class _StartPageState extends State<StartPage> {
  @override 
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/Intymelogo.JPG'),
      ),
    );

    final fotobutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          height: 42.0,
          minWidth: 200.0,
          onPressed: () { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StartPage())
            );
          },
          color: Colors.lightBlueAccent
          
          
        ),
      ),
    );

    

       
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 100.0,),
            fotobutton
          ],
        ),
      ),
    );
  }
}