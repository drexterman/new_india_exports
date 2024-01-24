// import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_flutter/Authentication/user_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_flutter/ui/forgot_password.dart';
import 'home.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isSigningIn=false ;
  final FocusNode _focusNodePassword = FocusNode();
  final FirebaseAuthService _auth= FirebaseAuthService();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  bool _obscurePassword = true;
  //final Box _boxLogin = Hive.box("login");
  //final Box _boxAccounts = Hive.box("accounts");

  @override
  Widget build(BuildContext context) {
    /*if (_boxLogin.get("loginStatus") ?? false) {
      return Home();
    }*/

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 231, 223),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            
            children: [
              Image.asset('assets/Logo.png'),
              Text(
                "Welcome back",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Login to your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 60),
              TextFormField(
                
                controller: _controllerEmail,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                //onEditingComplete: () => _focusNodePassword.requestFocus(),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email.";
                  } else if (!(value.contains('@') && value.contains('.'))) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerPassword,
                focusNode: _focusNodePassword,
                obscureText: _obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password.";
                  } /*else if (value !=
                      _boxAccounts.get(_controllerUsername.text)) {
                    return "Wrong password.";
                  }*/

                  return null;
                },
              ),
              const SizedBox(height: 10),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(child: Text('Forgot Password' , style: TextStyle(color: Color.fromARGB(255, 28, 77, 161) , fontWeight: FontWeight.bold) , ), 
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ForgotPasswordScreen()),
                  );
                  },
                  )
                ],
              
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      _signIn();
                      /*if (_formKey.currentState?.validate() ?? false) {
                        _boxLogin.put("loginStatus", true);
                        _boxLogin.put("userName", _controllerUsername.text);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            },
                          ),
                        );
                      }*/
                    },
                    child: _isSigningIn? CircularProgressIndicator(color: Colors.white,): Text("Login"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          _formKey.currentState?.reset();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Signup();
                              },
                            ),
                          );
                        },
                        child: const Text("Signup"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

void _signIn() async{

  setState((){
    _isSigningIn=true ;
  });

  String password= _controllerPassword.text;
  String email= _controllerEmail.text;

  User? user = await _auth.signInWithEmailAndPassword(email, password);
  setState((){
    _isSigningIn=false ;
  });

  if (user!=null){
    print("User is successfully Signed in");
    Navigator.push(context,MaterialPageRoute(builder: (context){return Home();}));
  }
  else{
    print("Some error");
  }
}

}
