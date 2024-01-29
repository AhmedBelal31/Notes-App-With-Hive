import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title, required this.icon,
  });
final String title ;
final IconData icon ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          const SizedBox(width: 5),
           Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              // fontFamily: 'Poppins'
            ),
          ),
          const Spacer(),
          Container(
            width: 45,
            height: 45,

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: IconButton(
              onPressed: () {},
              icon:  Icon(icon),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}