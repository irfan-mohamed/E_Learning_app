import 'package:e_learning/screens/Login/login.dart';
import 'package:flutter/material.dart';

class RegisterInstituition extends StatelessWidget {
  const RegisterInstituition({super.key});

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
                'Institution Register',
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
                    padding: const EdgeInsets.all(9.0),
                    child: StudentRegisterScreen(),
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

class StudentRegisterScreen extends StatefulWidget {
  @override
  _StudentRegisterScreenState createState() => _StudentRegisterScreenState();
}

// controllers declaration

final _institutionname = TextEditingController();
final _institutioncode = TextEditingController();
final _institutionaddress = TextEditingController();
final _institutionemail = TextEditingController();
final _password = TextEditingController();
final _confirmpassword = TextEditingController();

// steps container

class _StudentRegisterScreenState extends State<StudentRegisterScreen> {
  int _currentStep = 0;
  final List<Step> _steps = [
    Step(
      title: Text(''),
      content: Column(
        children: [
          TextFormField(
            controller: _institutionname,
            decoration: InputDecoration(
              labelText: 'Instituition Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _institutionaddress,
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
              labelText: 'Institution Address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _institutioncode,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Institution Code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      isActive: false,
    ),
    Step(
      title: Text(''),
      content: Column(
        children: [
          TextFormField(
            controller: _institutionemail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _confirmpassword,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      isActive: false,
    ),
  ];
  void _nextStep() {
    bool isStepValid = true;

    if (_currentStep == 0) {
      isStepValid = _institutionname.text.isNotEmpty &&
          _institutioncode.text.isNotEmpty &&
          _institutionaddress.text.isNotEmpty;
    } else if (_currentStep == 1) {
      isStepValid = _institutionemail.text.isNotEmpty &&
          _password.text.isNotEmpty &&
          _confirmpassword.text.isNotEmpty;
    }

    if (isStepValid && _currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else if (!isStepValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields')),
      );
    }
  }

  void _backStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Stepper(
        type: StepperType.horizontal,
        steps: _steps,
        currentStep: _currentStep,
        onStepContinue: _nextStep,
        onStepCancel: _backStep,
        stepIconBuilder: (index, step) {
          return Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == _currentStep ? Colors.blue : Colors.grey),
          );
        },
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(80, 40)),
                onPressed: _currentStep == 0 ? null : controls.onStepCancel,
                child: Text(_currentStep == 0 ? 'Previous' : 'Previous'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(90, 40)),
                onPressed: _currentStep == _steps.length - 1
                    ? _registerStudent
                    : controls.onStepContinue,
                child: Text(
                    _currentStep == _steps.length - 1 ? 'Register' : 'Next'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _registerStudent() {
    passwordCheck(_password.text, _confirmpassword.text);
  }

  void passwordCheck(_password, _confirmpassword) {
    if (_password != '' || _confirmpassword != '') {
      if (_password == _confirmpassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Thank you for Registration !!! KINDLY LOGIN'),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((ctx) {
              return LoginPage();
            }),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Both passwords are not same'),
          ),
        );
      }
    }
  }
}
