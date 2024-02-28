import 'package:flutter/material.dart';

class SelectRooms extends StatefulWidget {
  const SelectRooms({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  final DateTime startDate;
  final DateTime endDate;

  @override
  State<SelectRooms> createState() => _SelectRoomsState();
}

class _SelectRoomsState extends State<SelectRooms> {



  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.indigo.shade900,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'When will you be there?',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              Container(
                  width: double.infinity,
                  height: screenHeight - 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.startDate.toString()),
                      Text(widget.endDate.toString()),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );;
  }
}