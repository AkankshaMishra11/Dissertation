import 'package:flutter/material.dart';
import 'package:stela_app/constants/colors.dart';
import 'package:stela_app/screens/MyFiles.dart';
//import 'import 'package:stela_app/screens/BasicsexperimentList.dart';
import 'package:stela_app/screens/NumpyexperimentList copy.dart';
import 'package:stela_app/screens/MatplotlibexperimentList copy.dart';
import 'package:stela_app/screens/PandasexperimentList copy.dart';
import 'package:stela_app/screens/SeabornexperimentList copy.dart';
import 'package:stela_app/screens/TensorflowexperimentList copy.dart';
import 'package:stela_app/screens/SklearnexperimentList copy.dart';
import 'package:stela_app/screens/KerasexperimentList copy.dart';
import 'package:stela_app/screens/PytorchexperimentList copy.dart';
import 'package:stela_app/screens/pythontutorial.dart';
import 'package:stela_app/screens/CCtutorial.dart';
import 'package:stela_app/screens/COAtutorial.dart';
import 'package:stela_app/screens/profile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/userDetails.dart';

String usermanual1="https://docs.google.com/document/d/1-55-CJP_Be6KlZgdGFk6K_j7sFQeqGulqfCrZPD2bcA/edit?usp=sharing";
String usermanual2="https://docs.google.com/document/d/17BSKS0CJfcuGD0yRM-QXVqvQIPX1B32bSlrwduvC8KU/edit?usp=sharing";
String feedback="https://docs.google.com/spreadsheets/d/1SOxjjg91ezT3o8LFjrQ5F0GPOmRKqdrrGuBjVyYdo5A/edit?usp=sharing";
class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
   
    bool isFaculty = enrollmentNo == "FACULTY" || enrollmentNo == "Faculty";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: primaryWhite,
        appBar: AppBar(
          title: Text('STELA'),
          backgroundColor: primaryBar,
          // leading: TextButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     child: Icon(
          //       Icons.arrow_back,
          //       color: primaryWhite,
          //     )),
        ),

        body: SingleChildScrollView(
  child: Container(
    margin: EdgeInsets.symmetric(vertical: 200, horizontal: 10),
    child: Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PythonTutorial()),
            );
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryButton,
              border: Border.all(
                color: primaryBar,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  '1. Artificial Intelligence - Programming Tools',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'PTSerif-Bold',
                    color: primaryBar,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20), // Add spacing between buttons
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CCTutorial()),
            );
            // Handle the onPressed for the second button
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryButton,
              border: Border.all(
                color: primaryBar,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Text(
              '2. Cloud Computing',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'PTSerif-Bold',
                color: primaryBar,
              ),
            ),
          ),
        ),
        SizedBox(height: 20), // Add spacing between buttons
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => COATutorial()),
            );
            // Handle the onPressed for the third button
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryButton,
              border: Border.all(
                color: primaryBar,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Text(
              '3. Computer Organization and Architecture',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'PTSerif-Bold',
                color: primaryBar,
              ),
            ),
          ),
        ),
   SizedBox(height: 20),
         TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyFiles()),
            );
            // Handle the onPressed for the second button
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryButton,
              border: Border.all(
                color: primaryBar,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Text(
              'My Python Codes and Practice',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'PTSerif-Bold',
                color: primaryBar,
              ),
            ),
          ),
        ),
        SizedBox(height: 20), 

Container(
               alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryButton,
              border: Border.all(
                color: primaryBar,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: InkWell(
              onTap: () async {
                if (await canLaunch(usermanual1)) {
                  await launch(usermanual1, forceSafariVC: false, forceWebView: false);
                } else {
                  throw 'Could not launch $usermanual1';
                }
              },
             child: Text(
                'User Manual for using the application for students',
                                 style: TextStyle(
              fontSize: 20,
              fontFamily: 'PTSerif-Bold',
              color: primaryBar,
            ),
            textAlign: TextAlign.center,
              ),
            ),
          ),


  SizedBox(height: 20), 


 Container(
               alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryButton,
              border: Border.all(
                color: primaryBar,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: InkWell(
              onTap: () async {
                if (await canLaunch(feedback)) {
                  await launch(feedback, forceSafariVC: false, forceWebView: false);
                } else {
                  throw 'Could not launch $feedback';
                }
              },
             child: Text(
                'Feedback of the users',
                                 style: TextStyle(
              fontSize: 20,
              fontFamily: 'PTSerif-Bold',
              color: primaryBar,
            ),
            textAlign: TextAlign.center,
              ),
            ),
          ),



      ],
    ),
  ),
),

        /*body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 200, horizontal: 10),
            child: TextButton(
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryButton,
                    border: Border.all(
                      color: primaryBar,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text('Artificial Intelligence - Programming Tools',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'PTSerif-Bold',
                            color: primaryBar,
                          )),
                      Text('M. Tech.',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'PTSerif',
                            color: primaryBar,
                          )),
                      /*Text('>>>',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'PTSerif',
                            color: primaryBar,
                          ))*/
                    ],
                  )),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PythonTutorial()),
                );
              },
            ),
          ),
        ),*/
        bottomNavigationBar: Container(
          color: primaryBar,
          // padding: EdgeInsets.all(7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Subjects()),
                  );
                },
                icon: Icon(
                  Icons.home,
                  color: primaryWhite,
                  size: 35,
                ),
              ),
              // IconButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => AnalysisSubjects()),
              //     );
              //   },
              //   icon: Icon(
              //     Icons.saved_search_rounded,
              //     color: primaryWhite,
              //     size: 40,
              //   ),
              // ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                icon: Icon(
                  Icons.account_circle,
                  color: primaryWhite,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
