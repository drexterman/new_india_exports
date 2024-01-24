
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _controllerEmail = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerEmail.dispose();
    super.dispose();
  }

  
  
  @override
  Widget build(BuildContext context) {

    Future passwordReset() async{
    
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _controllerEmail.text.trim());
      showDialog(
        context: context, builder: (context) {
        return AlertDialog(
          content: Text('Link Sent to email !'),
        );
      },);
    } on FirebaseAuthException catch (e){
      print(e);
      var error_message = e.message.toString();
      var snackBar = SnackBar(
        content: Text(error_message),
      );
      showDialog(
        context: context, builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      },);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }

    
    return Scaffold(

      body: Center(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(30.0),

          child: Column(
          
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // Padding(padding: EdgeInsets.fromLTRB(40, 0 , 10,  0 )),
          
          
              Text("Enter your email , we will send you a reset link : ", style: TextStyle(
                fontSize: 18
              ),),
              Padding(padding: EdgeInsets.all(10)),
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
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () { 
                    passwordReset();
                   },
                  child: Text('Send Link'),
                )
            ],
          ),
        ),
      ) )
;  }}