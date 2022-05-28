import 'package:flutter/material.dart';

class ReservationErrorWidget extends StatelessWidget {
  final String message;

  ReservationErrorWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
