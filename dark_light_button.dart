import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final Color? color;
  final void Function()? onTap;

  const MyButton({required this.color, required this.onTap, Key? key})
      : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        child: const Center(child: Text("TAP")),
      ),
    );
  }
}
