import 'package:flutter/material.dart';

class HotelsAvailable extends StatelessWidget {
  const HotelsAvailable({
    super.key,
    required this.formattedDateString,
    required this.adultCount,
    required this.roomCount,
  });

  final String formattedDateString;
  final int adultCount;
  final int roomCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Riyadh, Riyadh, Saudi Arabia'),
            Row(
              children: [
                Text(formattedDateString),
                Row(
                  children: [
                    Icon(Icons.person),
                    Text('$adultCount'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.key),
                    Text('$roomCount'),
                  ],
                ),
              ],
            ),
          ],
        ),
        
      ),
    );
  }
}