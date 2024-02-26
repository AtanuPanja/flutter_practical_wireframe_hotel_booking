import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practical4_hotel_booking/HomePage.dart';
import 'package:practical4_hotel_booking/validations/validations.dart';
import 'model/app_database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // referencing the hive box
  final myBox = Hive.box('myBox');

  // instantiating the database
  AppDatabase appDB = AppDatabase();

  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    phoneController.clear();

    if (myBox.get('usersList') != null) {
      appDB.loadUsers();
    }
  }

  // perform logout action
  void logoutAction() {
    for (var index = 0; index < appDB.usersList.length; index++) {
        // logging out all users
        // Navigator.of(context).pop();
        // this navigator pop statement, showed an error
        // so, I shifted this line to the HomePage, and called it before the logoutAction
        // the error was resolved
        setState(() {
          appDB.usersList[index]['isLoggedIn'] = 'false';
          appDB.updateDatabase();
          print(appDB.usersList);
        });

      }
  }


  // perform login action
  void loginAction() {
    // search for already existing user with the same phone
      for (var index = 0; index < appDB.usersList.length; index++) {
        // making sure all other users are logged out
        appDB.usersList[index]['isLoggedIn'] = 'false';

        // searching for the user in the db
        // if available, set isLoggedIn = true
        if (appDB.usersList[index]['phone'] == phoneController.value.text) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage(logoutAction: logoutAction)),
          );
          setState(() {
            appDB.usersList[index]['isLoggedIn'] = 'true';
            appDB.updateDatabase();
            print(appDB.usersList);
          });

          return;
        }
      }

      // if after searching we find that, user is not in db
      // this statement will be reached only when the for loop completes, without triggering
      // the return statement
      var newUser = {
        'phone': phoneController.value.text,
        'isLoggedIn': 'true',
      };
      setState(() {
        appDB.usersList.add(newUser);
        appDB.updateDatabase();
      });
  }

  // this callback is called when the continue button is pressed
  void continueButtonCallback() {
    // if phone number is valid
    if (validatePhone(phoneController.value.text)) {
      loginAction();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              child: Column(
                children: [
                  Text('Phone is invalid'),
                  ElevatedButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Icon(Icons.close),
                ),
                Expanded(
                    child: Text(
                  'Login or Signup',
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                Text('Welcome to HoldInn'),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade700,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Country/Region',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  Text('India (+91)'),
                                ],
                              ),
                            ),
                            InkWell(
                              child: Icon(Icons.keyboard_arrow_down),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: TextField(
                          controller: phoneController,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Phone number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "We'll call or text to confirm your number, standard message and data rates apply.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'By signing in to this app, you agree to the HoldInn ',
                        ),
                        TextSpan(
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          text: 'Terms & Conditions ',
                        ),
                        TextSpan(
                          text: 'and acknowledge the ',
                        ),
                        TextSpan(
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                            text: 'Privacy Policy.'),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: continueButtonCallback,
                  child: Text('Continue'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth / 2.5,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text('or'),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: screenWidth / 2.5,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: Text(
                    'Show more options',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
