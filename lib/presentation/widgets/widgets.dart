
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const CustomIconButton({Key? key, required this.icon, required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonContent = Container(height: 44, child:
    Row(children: [
      Icon(icon, size: 24),
      SizedBox(width: 8),
      Text(title) ,
    ]),
    );
    final button = ElevatedButton(onPressed: onPressed, child: buttonContent);

    return Row(mainAxisSize: MainAxisSize.max, children: [
      SizedBox(width: 32),
      Expanded(child: button),
      SizedBox(width: 32),
    ]);
  }
}



