import 'package:flutter/material.dart';
import 'package:sl_mate/components/main_drawer.dart';
import 'package:sl_mate/model/user_account_model.dart';
import 'package:sl_mate/pages/qr.dart';
import 'package:sl_mate/pages/ticket.dart';
import 'package:sl_mate/services/user_account_service.dart';

class HomePage extends StatefulWidget {
  final accessToken;
  final username;
  final email;
  final id;
  final balance;
  final status;
  final accountNo;

  HomePage(
      {this.accessToken,
      this.username,
      this.email,
      this.id,
      this.balance,
      this.status,
      this.accountNo});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: MainDrawer(
          accessToken: widget.accessToken,
          email: widget.email,
          username: widget.username),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                        offset: Offset(0, 10),
                        blurRadius: 20)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Text(
                          'My Wallet',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Text(
                          widget.balance.toString(),
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Account No: ' + widget.accountNo,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          widget.status,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //ayin kala
            SizedBox(
              height: 60,
              width: double.infinity,
              child: new RaisedButton(
                color: Colors.lightBlue,
                child: new Text(
                  "My QR",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => new QrPage(
                              accessToken: widget.accessToken,
                              email: widget.email,
                              username: widget.username,
                            ))),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
              ),
            ),
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: new RaisedButton(
                color: Colors.lightBlue,
                child: new Text(
                  "View Ticket",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () => Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new Ticket())),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
