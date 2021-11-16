import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({Key? key}) : super(key: key);

  @override
  _Register_ScreenState createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  TextEditingController username_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  final double separacion_widgets_menor = 12;
  final double separacion_widgets_mayor = 24;
  final double padding = 32;

  var color_email = Colors.black;

  final int max_char_username = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: username_controller,
                decoration:
                    InputDecoration(hintText: "Usuario", counterText: ""),
                maxLength: max_char_username,
                showCursor: false,
              ),
              SizedBox(
                height: separacion_widgets_menor,
              ),
              TextField(
                controller: email_controller,
                style: TextStyle(color: color_email),
                decoration: InputDecoration(hintText: "Email"),
                keyboardType: TextInputType.emailAddress,
                onEditingComplete: () {
                  if (!EmailValidator.validate(email_controller.text.trim())) {
                    setState(() {
                      color_email = Colors.red;
                    });
                  } else {
                    setState(() {
                      color_email = Colors.black;
                    });
                  }
                },
              ),
              SizedBox(
                height: separacion_widgets_menor,
              ),
              TextField(
                controller: password_controller,
                decoration: InputDecoration(hintText: "Contraseña"),
                obscureText: true,
              ),
              SizedBox(
                height: separacion_widgets_mayor,
              ),
              TextButton(
                  onPressed: () => null,
                  child: Text(
                    "Registrarse",
                    style: TextStyle(color: Colors.black87),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey[300]),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: separacion_widgets_mayor,
                          vertical: separacion_widgets_menor))))
            ],
          ),
        ),
      ),
    );
  }
}
