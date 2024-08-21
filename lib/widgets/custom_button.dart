import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: MediaQuery.of(context).size.height * 0.08,
        width: double.infinity,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }
}
