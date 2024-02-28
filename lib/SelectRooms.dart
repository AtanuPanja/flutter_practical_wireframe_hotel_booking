import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // provides the DateFormat utility

import 'HotelsAvailable.dart';

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
  int rooms = 1;
  int adults = 1;
  int children = 0;
  int infants = 0;

  void increaseCount(String entityType) {
    switch (entityType.toLowerCase()) {
      case 'rooms':
        rooms += 1;
        break;
      case 'adults':
        adults += 1;
        break;
      case 'children':
        children += 1;
        break;
      case 'infants':
        infants += 1;
        break;
      default:
    }
    setState(() {});
  }

  void decreaseCount(String entityType) {
    switch (entityType.toLowerCase()) {
      case 'rooms':
        rooms -= 1;
        break;
      case 'adults':
        adults -= 1;
        break;
      case 'children':
        children -= 1;
        break;
      case 'infants':
        infants -= 1;
        break;
      default:
    }
    setState(() {});
  }

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
                'Add the number of guests',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              Container(
                  width: double.infinity,
                  height: screenHeight - 100,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Riyadh, Riyadh, Saudi Arabia'),
                      Text(
                          "${DateFormat("dd MMM").format(widget.startDate)}-${DateFormat("dd MMM").format(widget.endDate)}"),
                      Column(
                        children: [
                          CustomRowForSelection(
                            title: 'Rooms',
                            subtitle: 'Total room',
                            increaseCount: () => increaseCount('Rooms'),
                            decreaseCount: () => decreaseCount('Rooms'),
                            count: '$rooms',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomRowForSelection(
                            title: 'Adults',
                            subtitle: 'Age 13yr and above',
                            increaseCount: () => increaseCount('Adults'),
                            decreaseCount: () => decreaseCount('Adults'),
                            count: '$adults',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomRowForSelection(
                            title: 'Children',
                            subtitle: 'Age 2-12yr',
                            increaseCount: () => increaseCount('Children'),
                            decreaseCount: () => decreaseCount('Children'),
                            count: '$children',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomRowForSelection(
                            title: 'Infant',
                            subtitle: 'under 2',
                            increaseCount: () => increaseCount('Infants'),
                            decreaseCount: () => decreaseCount('Infants'),
                            count: '$infants',
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HotelsAvailable(
                                      formattedDateString:
                                          "${DateFormat("dd MMM").format(widget.startDate)}-${DateFormat("dd MMM").format(widget.endDate)}",
                                      adultCount: adults,
                                      roomCount: rooms),
                                ),
                              );
                            },
                            child: Text('Search'),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRowForSelection extends StatelessWidget {
  const CustomRowForSelection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.increaseCount,
    required this.decreaseCount,
    required this.count,
  });
  final String title;
  final String subtitle;
  final VoidCallback increaseCount;
  final VoidCallback decreaseCount;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(subtitle),
          ],
        ),
        Row(
          children: [
            RawMaterialButton(
              onPressed: () {
                decreaseCount();
              },
              child: Icon(Icons.remove),
            ),
            SizedBox(
              width: 10,
            ),
            Text(count),
            SizedBox(
              width: 10,
            ),
            RawMaterialButton(
              onPressed: () {
                increaseCount();
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
