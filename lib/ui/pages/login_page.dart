import 'package:musicapps/core/api_services/authentication_service.dart';
import 'package:musicapps/ui/pages/home_page.dart';
import 'package:musicapps/ui/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  bool ishidden = true;

  late String email, password;

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
          height: 60,
        ),
        Container(
          width: 200,
          height: 200,
          child: Image(
            image: AssetImage('lib/assets/logo/engapp-logos_black.png'),
          ),
        ),
        SizedBox(
          height: 40,
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
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
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
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Center(
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      password = value;
                      return null;
                    },
                    obscureText: ishidden,
                    decoration: InputDecoration(
                        hintText: "password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              ishidden = !ishidden;
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
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      "I don't have any account yet",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  SizedBox(width: 18),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    onPressed: loginPressed,
                    child: Text("Login")),
              )
            ],
          ),
        ));
  }

  void loginPressed() {
    if (_formkey.currentState!.validate()) {
      login();
    }
  }

  void login() async {
    var result =
        await AuthenticationService().login(email: email, password: password);
    print(result.toString());
    if (result == 400) {
      print('something went wrong');
      final snackBar = SnackBar(
        content: const Text("Something went wrong!"),
      );
    }
    if (result == 401) {
      print('Wrong email or password!');
      final snackBar = SnackBar(
        content: const Text("Wrong email or password!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (result == null) {
      print('user not found');
      final snackBar = SnackBar(
        content: const Text("User not found!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
