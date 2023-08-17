import 'package:e_learning/screens/Login/RegisterInstitution.dart';
import 'package:e_learning/screens/Login/RegisterStudent.dart';
import 'package:e_learning/screens/introduction.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Log In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'roboto'),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: Container(
                  height: height * 0.5,
                  width: width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LoginForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isStudentMode =
      true; // Determines whether student or institution mode is active
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _institutioncode = TextEditingController();
  final _institutionpassword = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isStudentMode = true;
                      });
                    },
                    child: Text(
                      'Student',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isStudentMode = false;
                      });
                    },
                    child: Text(
                      'Institution',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  isStudentMode
                      ? Column(
                          children: [
                            TextField(
                              controller: _email,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            TextField(
                              controller: _password,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(150, 50)),
                              onPressed: () {
                                setState(() {
                                  if (_email.text.isEmpty ||
                                          _password.text.isEmpty
                                      ? _validate = true
                                      : _validate = false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Email and Password Are Required')));
                                  } else {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) {
                                          return MyHomePage();
                                        }),
                                      ),
                                    );
                                  }
                                });
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Row(
                              children: [
                                Text("Not a Design Thinker?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) {
                                          return Registerstudent();
                                        }),
                                      ),
                                    );
                                  },
                                  child: Text('Be One.'),
                                ),
                              ],
                            )
                          ],
                        )
                      : Column(
                          children: [
                            TextField(
                              controller: _institutioncode,
                              decoration: InputDecoration(
                                labelText: 'Institution Code',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            TextField(
                              controller: _institutionpassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(150, 50)),
                              onPressed: () {
                                setState(() {
                                  if (_institutioncode.text.isEmpty ||
                                          _institutionpassword.text.isEmpty
                                      ? _validate = true
                                      : _validate = false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Institution Code and Password Are Required')));
                                  }
                                });
                                // Add login logic here
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Row(
                              children: [
                                Text("Don't have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) {
                                          return RegisterInstituition();
                                        }),
                                      ),
                                    );
                                  },
                                  child: Text('Register Here.'),
                                ),
                              ],
                            )
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
