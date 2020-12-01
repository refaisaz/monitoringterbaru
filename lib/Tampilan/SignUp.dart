import 'package:flutter/material.dart';
import 'package:Monitoring/Komponen/kustom_button.dart';
import 'package:Monitoring/Komponen/kustom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:Monitoring/authent.dart';

//Register sebagai seller screen belum
class SignUp extends StatefulWidget {

  static const routeId = 'signupScreen';

  @override
  _SignUpScreen createState() => _SignUpScreen();

  //Testing belum diapa2in

}

class _SignUpScreen extends State<SignUp>{

  TextEditingController _nameController = TextEditingController();
  TextEditingController _displayNameController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String validationText = '';

  void onCompleteRegis(String message){
    setState(() {
      validationText = message;
    });
    //Perlu langsung di navigate ke home?
  }

  void signUp()async{
    var email = _emailController.text.toString();
    var password = _passwordController.text.toString();
    var role = int.parse(_roleController.text);
    var displayName = _displayNameController.text.toString();
    var name = _nameController.text.toString();
    await Provider.of<Auth>(context, listen: false).signUp(email, password, role, name, displayName, onCompleteRegis);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Email',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                iconData: Icons.email,
                keyboardType: TextInputType.emailAddress,
                color: Colors.white,
              ),
              Text('Password',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                iconData: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
                isObscure: true,
                color: Colors.white,
              ),
              Text('Name',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextField(
                controller: _nameController,
                hintText: 'name',
                iconData: Icons.text_fields,
                keyboardType: TextInputType.text,
                color: Colors.white,
              ),
              Text('Display Name',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextField(
                controller: _displayNameController,
                hintText: 'display name',
                iconData: Icons.text_fields,
                keyboardType: TextInputType.text,
                color: Colors.white,
              ),
              Text('Role',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextField(
                controller: _roleController,
                hintText: 'role',
                iconData: Icons.account_circle,
                keyboardType: TextInputType.number,
                color: Colors.white,
              ),
              Text(
                validationText,
                style: TextStyle(
                  color: Colors.black)
                ),
              CustomRaisedButton(
                color: Colors.blue[500],
                text: 'Register',
                callback: (){signUp();},
              ),
          ],
        )
      ),
    );
  }
}