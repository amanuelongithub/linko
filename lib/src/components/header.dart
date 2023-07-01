import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/avatar5.png'),
        ),
        CircleAvatar(
          radius: 22,
          backgroundColor: Color.fromARGB(170, 226, 226, 226),
          child: Icon(Icons.more_horiz,color: Colors.grey,),
        ),
      ],
    );
  }
}
