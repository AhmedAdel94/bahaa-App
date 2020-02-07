import 'package:flutter/material.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';

class SideDrawer extends StatelessWidget {
  final bloc = AuthBloc.instance();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(),
                  ListTile(
                    title: Text('Profile'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Settings'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Signout'),
              onTap: () {
                // Update the state of the app.
                // ...
                bloc.dispatch(LogoutTapped());
                print("Logout tapped");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
