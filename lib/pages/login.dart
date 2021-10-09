import 'package:flutter/material.dart';
import 'package:sl_mate/components/animattion.dart';
import 'package:sl_mate/model/login_model.dart';
import 'package:sl_mate/model/user_model.dart';
import 'package:sl_mate/pages/home.dart';
import 'package:sl_mate/services/login_service.dart';
import 'package:sl_mate/services/user_service.dart';

import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  late LoginRequestModel requestModel;
  bool isApiCallProcess = false;
  String userName = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel(userName: "", password: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scffoldKey,
      backgroundColor: Colors.purpleAccent,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              //height: 720,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                        offset: Offset(0, 10),
                        blurRadius: 20)
                  ]),

              child: Form(
                key: globalKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new TextFormField(
                        keyboardType: TextInputType.text,
                        onSaved: (input) => requestModel.userName = input!,
                        validator: (input) => input!.length < 3
                            ? "username should be valid"
                            : null,
                        decoration: new InputDecoration(
                            hintText: "User Name",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ))),
                    SizedBox(
                      height: 20,
                    ),
                    new TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) => requestModel.password = input!,
                      validator: (input) => input!.length < 3
                          ? "Password  should be more than 3 characters"
                          : null,
                      obscureText: hidePassword,
                      decoration: new InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                Theme.of(context).accentColor.withOpacity(0.2),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor)),
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          color: Theme.of(context).accentColor.withOpacity(0.4),
                          icon: Icon(hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 100,
                      ),
                      onPressed: () {
                        if (validateAndSave()) {
                          print(requestModel.toJson());
                        }
                        LoginService loginService = new LoginService();
                        loginService.login(requestModel).then((value) => {
                              if (value.accessToken != null &&
                                  !value.accessToken.isEmpty)
                                {
                                  Navigator.of(context)
                                      .push(new MaterialPageRoute(
                                          builder: (context) => new HomePage(
                                                username: value.username,
                                                email: value.email,
                                                accessToken: value.accessToken,
                                              ))),
                                }
                              else
                                {
                                  Fluttertoast.showToast(
                                      msg: 'Invalid UserName or Password')
                                }
                            });
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Theme.of(context).accentColor,
                      shape: StadiumBorder(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
