import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ctp1/Providers/login_prov.dart';
import 'package:ctp1/core/Models/clientes_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget PDawer(BuildContext context) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        
        children: <Widget>[
              DrawerHeader(
                curve: Curves.fastOutSlowIn,
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              
              ListTile(
                title: Text('Cerrar Sesión'),
                onTap: () {
                  signOut(context);
                  // Navigator.of(context).popAndPushNamed('/login');
                  // ...
                },
              ),
        ],
      ),
            ],
          ),
    ),
  );
}


Future<void> signOut(BuildContext context) async {
  try {
    final signOut = Provider.of<UserRepository>(context, listen: false);
    await signOut.signOut();
    print('--------------------------EXITO SALIR-----------------');
  } catch (e) {
    print('-----------------RESULTADO ERROR-----------------' + e.toString());
  }
}
