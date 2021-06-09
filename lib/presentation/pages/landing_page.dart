import 'package:flutter/material.dart';

import 'package:flutter_labinar_demo/presentation/widgets/widgets.dart';


class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    void login(BuildContext context) => Navigator.of(context).pushNamed('/list');

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SafeArea(
          child: Column( children: [
            Container(height: MediaQuery.of(context).size.height * 0.33,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.red],
                ),
                borderRadius: BorderRadius.circular(8),
              ),),
            Text('Welcome', style: Theme.of(context).textTheme.headline3,),
            SizedBox(height: 40),
            CustomIconButton(icon: Icons.login, title: 'Login', onPressed: () => login(context)),
          ]),
        ),
      ),
    );
  }
}
