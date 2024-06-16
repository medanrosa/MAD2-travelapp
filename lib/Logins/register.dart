import 'package:flutter/material.dart';
import 'package:negombo/Logins/auth.dart';
import 'login.dart';

class SignUpScreen extends StatelessWidget {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  void _signup(BuildContext context) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
      if (user != null) {
        print("User Created Successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } catch (e) {
      print("Error Signing Up: $e");
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an Account"),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/loginimage.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Center(
            child: Container(
              width: 320,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 50),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.teal.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _password,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.teal.withOpacity(0.5),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _signup(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal.withOpacity(0.8),
                      onPrimary: Colors.white,
                    ),
                    child: Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
