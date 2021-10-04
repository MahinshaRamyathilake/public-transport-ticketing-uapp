import 'package:flutter/material.dart';
import 'package:sl_mate/pages/login.dart';

class MainDrawer extends StatelessWidget {
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
                    margin: EdgeInsets.only(
                        top: 30,
                        bottom: 10
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/220px-User_icon_2.svg.png"
                        ),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                  Text("MenukaJ",style: TextStyle(
                      fontSize: 22,
                      color: Colors.white
                    ),
                  ),
                  Text("MenukaJ@gmail.com",style: TextStyle(
                      fontSize: 22,
                      color: Colors.white
                  ),
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
              ),
            ),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new LoginPage(
                ))),
          )
        ],
      ),
    );
  }
}
