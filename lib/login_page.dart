import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tugas_akhir/DB/auth_api.dart';
import 'package:tugas_akhir/bot_nav.dart';
import 'package:tugas_akhir/dashboard.dart';
import 'package:tugas_akhir/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String busStopLogo = 'assets/images/logo_busstop.svg';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthApi _apiHandler = AuthApi();
  bool _isLoading = false;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 800),
        content: Text(message),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 130),
              SvgPicture.asset(
                busStopLogo,
                width: 245,
              ),
              SizedBox(height: 100),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  child: Text(
                    "Login to Your Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0.2,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ]
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      )
                      ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 211, 210, 210),
                      )
                    )
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0.2,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ]
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      )
                      ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 211, 210, 210),
                      )
                    )
                  )
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton(
                onPressed: _isLoading ? null : () async {

                  FocusScope.of(context).unfocus();

                  String email = _emailController.text;
                  String password = _passwordController.text;
                  
                  if (email.isEmpty || password.isEmpty) {
                    _showMessage('jangan lupa isi email and password ya!');
                    return;
                  }

                  setState(() {
                    _isLoading = true;
                  });

                  dynamic result = await _apiHandler.login(
                        email: email, password: password);

                  setState(() {
                    _isLoading = false;
                  });

                  if(result != null){

                    _showMessage('Login successful!');
                    // Delay 1.24 seconds
                    await Future.delayed(Duration(seconds: 1, milliseconds: 240));
                    // print('User Data: ${result}');
                    // Navigate to the next page or perform your login action
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BotNavbar(idUser: result.id)));
                  } else {
                    _showMessage("Invalid email or password ");
                  };
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(300, 60),
                  backgroundColor: Color.fromARGB(255, 33, 53, 85),
                ),
                child: _isLoading ? CircularProgressIndicator() : Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                )
              ),
              SizedBox(height: 35),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        },
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
