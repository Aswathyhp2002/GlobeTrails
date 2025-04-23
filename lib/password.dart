import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;
  bool _isPasswordVisible3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top section with gradient and logo
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade900, Colors.blue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/logo.png', // Ensure the logo is in the assets folder
                  height: 100,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Bottom section with password fields
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10),
                ],
              ),
              child: Column(
                children: [
                  buildPasswordField("Current Password", _isPasswordVisible1, () {
                    setState(() {
                      _isPasswordVisible1 = !_isPasswordVisible1;
                    });
                  }),
                  SizedBox(height: 10),
                  buildPasswordField("New Password", _isPasswordVisible2, () {
                    setState(() {
                      _isPasswordVisible2 = !_isPasswordVisible2;
                    });
                  }),
                  SizedBox(height: 10),
                  buildPasswordField("Confirm Password", _isPasswordVisible3, () {
                    setState(() {
                      _isPasswordVisible3 = !_isPasswordVisible3;
                    });
                  }),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle password change logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Save", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPasswordField(String hint, bool isVisible, VoidCallback toggleVisibility) {
    return TextField(
      obscureText: !isVisible,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: IconButton(
          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: toggleVisibility,
        ),
      ),
    );
  }
}
