import 'package:flutter/material.dart';
import 'package:pimiii/components/constanst.dart';

class Input extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;

  const Input({
    super.key,
    this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        hintStyle: lightGrey,
        prefixIcon: Icon(
          icon,
          color: Colors.grey.shade500,
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key, required this.function, required this.text});

  final VoidCallback? function;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text ?? '',
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
          )),
    );
  }
}

class HomePageButton extends StatelessWidget {
  const HomePageButton({
    Key? key,
    this.backgroundColor,
    this.text,
    this.textColor,
    this.isOutline = false,
    this.onTap,
    this.borderColor
  }) : super(key: key);

  final Color? backgroundColor;
  final String? text;
  final Color? textColor;
  final bool isOutline;
  final Function()? onTap;
  final Color? borderColor; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(maxWidth: double.infinity),
        width: 100,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: isOutline
              ? Border.all(color: borderColor ?? Colors.blue)
              : null,
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text ?? '',
          style: TextStyle(
            fontSize: 18,
            color: textColor ?? Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}


class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, child: Container());
  }
}
