import 'package:flutter/material.dart';
import 'package:sl_mate/components/animattion.dart';
import 'package:sl_mate/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).hintColor.withOpacity(0.2),
                      offset: Offset(0, 10),
                      blurRadius: 20
                  )
                ]
              ),
              child: Form(
                key: globalKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Text("Login", style: Theme.of(context).textTheme.headline2,),
                    SizedBox(height: 20,),
                    new TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (input)=> input!.contains("@")?"Email should be valid" : null,
                      decoration: new InputDecoration(
                        hintText: "Email Address",
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor.withOpacity(0.2),
                        ),

                        ),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)
                      ),
                        prefixIcon: Icon(Icons.email,
                          color: Theme.of(context).accentColor,
                        )
                    ))
                  ],
                ),),
            ),

          ],
        ),
      ),

    );
  }
}
