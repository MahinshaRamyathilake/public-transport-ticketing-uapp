import 'package:flutter/material.dart';
import 'package:sl_mate/model/login_model.dart';
import 'package:sl_mate/model/user_model.dart';
import 'package:sl_mate/pages/login.dart';
import 'package:sl_mate/pages/qr.dart';
import 'package:sl_mate/pages/ticket.dart';
import 'package:sl_mate/services/user_service.dart';

class MainDrawer extends StatelessWidget {
  final accessToken;
  final username;
  final email;

  MainDrawer({this.accessToken, this.username, this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30, bottom: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/220px-User_icon_2.svg.png"),
                            fit: BoxFit.fill)),
                  ),
                  Text(
                    username,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.qr_code),
            title: Text(
              'My QR',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new QrPage(
                      username: username,
                      email: email,
                      accessToken: accessToken,
                    ))),
          ),
          ListTile(
            leading: Icon(Icons.airplane_ticket),
            title: Text(
              'My Ticket',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => new Ticket())),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => new LoginPage())),
          )
        ],
      ),
    );
  }
}
