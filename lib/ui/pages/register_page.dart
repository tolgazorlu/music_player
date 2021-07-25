import 'package:flutter/material.dart';
import 'package:musicapps/core/api_services/authentication_service.dart';
import 'package:musicapps/core/models/user_model.dart';

import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  bool isobscure = true;

  late String name, surname, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _appLogo() {
    return Column(
      children: [
        SizedBox(
          height: 35,
        ),
        Container(
          width: 200,
          height: 200,
          child: Image(
            image: AssetImage('lib/assets/logo/engapp-logos_black.png'),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/background.jpg"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.dstATop))),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              _appLogo(),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22),
                child: Center(
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }

                      name = value;
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "name",
                        prefixIcon: Icon(
                          Icons.person,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22),
                child: Center(
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your surname";
                      }
                      surname = value;
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "surname",
                        prefixIcon: Icon(
                          Icons.person,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22),
                child: Center(
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      email = value;
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "email",
                        prefixIcon: Icon(
                          Icons.email,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22),
                child: Center(
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      password = value;
                      return null;
                    },
                    obscureText: isobscure,
                    decoration: InputDecoration(
                        hintText: "password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isobscure = !isobscure;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye),
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.lock,
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Do you have account ?",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )),
                  SizedBox(width: 18),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    onPressed: registerPressed,
                    child: Text("REGISTER")),
              )
            ],
          ),
        ));
  }

  void registerPressed() {
    if (_formkey.currentState!.validate()) {
      //? kayıt işlemleri başlat
      register();
    }
  }

  void register() async {
    var tempUser = UserModel(
        userName: name,
        userSurname: surname,
        userEmail: email,
        userPassword: password);
    var result = await AuthenticationService().register(userModel: tempUser);

    if (result != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(
            //   userModel: result,
            ),
      ));
    }
  }
}
