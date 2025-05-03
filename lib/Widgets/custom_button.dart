import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  const CustomButton({
    super.key,
    this.icon,
    this.isLoading = false,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        backgroundColor: Colors.cyan,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
        ),
      ),
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            )
          : Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 26, color: Colors.black),
              ),
            ),
    );
  }
}
