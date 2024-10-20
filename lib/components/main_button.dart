import 'package:flutter/material.dart';

class MostButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  const MostButton({
    this.isLoading = false,
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(12),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff0F55E8),
                Color(0xff04050F00),
                Color(0xff0F55E8),
              ],
            ),
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                  ),
          )),
    );
  }
}
