import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
      ),
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
                  child: Text('Login or Signup', textAlign: TextAlign.center,)
                ),
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
                                  Text('Country/Region', style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade700,
                                  ),),
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
                  onPressed: () {},
                  child: Text('Continue'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: Text('Forgot Password?', style: TextStyle(
                        color: Colors.blue,
                      ),),
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
                    SizedBox(width: 4,),
                    Text('or'),
                    SizedBox(width: 4,),
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
                  onTap: (){},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
