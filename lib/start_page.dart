import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'calendar_page.dart';



class StartPage extends StatefulWidget {
  static String tag = 'start-page';
  @override
  _StartPageState createState() => new _StartPageState(); 
}

class _StartPageState extends State<StartPage> {
  @override 
  Widget build(BuildContext context) {

    final logo = Material(
      elevation: 4.0,
      shape: CircleBorder(),
      color: Colors.transparent,
      child: Ink.image(
        image: AssetImage('assets/Intymelogo.JPG'),
        fit: BoxFit.cover,
        width: 30.0,
        height: 100.0,
        child: InkWell(
          onTap: () {},
          child: null,
        ),
      ),
    );

    final fotobutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
        child: FloatingActionButton(
          onPressed: () { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalendarPage())
            );
          },
          backgroundColor: Colors.lightGreen  
        ),
      );
  

    final eventPageButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
        child: FlatButton(
          onPressed: () { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventPage())
            );
          },
          child: Container(
            child: Row(children: <Widget>[
              Icon(
                Icons.event_note,
                color: Colors.white,
                size: 20.0,
              ),
              SizedBox(
                width: 10.0,
              ),  
              Text(
              "Events",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0
                )
              )
            ],)
              )
            ),
          );
          
    //
    final discoverPageButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
        child: FlatButton(
          onPressed: () { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventPage())
            );
          },
          child: Container(
            child: Row(children: <Widget>[
              Icon(
                Icons.event,
                color: Colors.white,
                size: 20.0,
              ),
              SizedBox(
                width: 10.0,
              ),  
              Text(
              "Discover",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0
                )
              )
            ],)
              )
            ),
          );      
           
      
     

    

       
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 220.0,),
            eventPageButton,
            discoverPageButton,
            SizedBox(height: 80.0,),
            fotobutton
          ],
        ),
      ),
    );
  }
}

// Nächster Slide

class CalendarPage extends StatefulWidget {
  static String tag = 'calendar-page';
  @override
  _CalendarPageState createState() => new _CalendarPageState(); 
}

class _CalendarPageState extends State<CalendarPage> {
  @override 
  Widget build(BuildContext context) {

    

    final calendarbutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: FloatingActionButton(
          onPressed: () {
            // Hier muss in die Firebase Datenbank geschrieben werden
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(calendarservice.writeCalendar()),
                );
              },
            );
          }
            
          
          
          
          
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
            SizedBox(
              height: 400.0,
            ),
            calendarbutton
          ],
        ),
      ),
    );
  }
}

// Slide for showing events

class EventPage extends StatefulWidget {
  static String tag = 'event-page';
  @override
  _EventPageState createState() => new _EventPageState(); 
}

class _EventPageState extends State<EventPage> {
  @override 
  Widget build(BuildContext context) {

    
    // Normal Appbar for Slide EventPage
    final eventPageAppbar = AppBar(
      title: Text('todo'),
      backgroundColor: Colors.grey[900]
      
    );
    
    // Variabels for widget eventContainer

    // Need a loop to append new Events to the list
    // Maybe from a storage of save Events -> Database ????
    // Count how much entries 
    final List<String> eventEntries = <String>['A', 'B', 'C'];

    // Now for testing, later not necessary
    //final List<int> colorCodes = <int>[600, 500, 100];
  

    // Build Container with Events
    final eventContainer = Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 550.0,
          child: ListView.builder(
            
            scrollDirection: Axis.horizontal,
            itemCount: eventEntries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                //padding: EdgeInsets.only(left: 30),
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), color: Colors.white
                ),
                width: 200,
                child: Column(children: <Widget>[
                  Image.asset('assets/testocr.png'),
                  //FlutterLogo(size: 400.0),
                  // Text wird aus der Firebase Datenbank abgerufen
                  Flexible(
                    child: Text("Name of the Event",
                     style: new TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 15.0
                      )
                    )
                  ),
                  SizedBox(height: 5.0,),
                  Flexible(
                    child: Text("Date of the Event",
                     style: new TextStyle(
                       fontWeight: FontWeight.w300,
                       fontSize: 15.0
                      )
                    )
                  ),
                  SizedBox(height: 5.0,),
                  Flexible(
                    child: Text("Location of the Event")
                  )
                ],)  
              );  
            },
          ),
    );
       
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            eventPageAppbar,
            eventContainer
          ],
        ),
      ),
    );
  }
}