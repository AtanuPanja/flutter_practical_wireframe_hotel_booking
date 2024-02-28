import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // provides the DateFormat utility
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'SelectRooms.dart';

class SelectDateRange extends StatefulWidget {
  const SelectDateRange({
    super.key,
  });

  @override
  State<SelectDateRange> createState() => _SelectDateRangeState();
}

class _SelectDateRangeState extends State<SelectDateRange> {

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

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
                      Column(
                        children: [
                          Text('Riyadh, Riyadh, Saudi Arabia'),
                          Text("${DateFormat("dd MMM").format(startDate)}-${DateFormat("dd MMM").format(endDate)}"),
                        ],
                      ),
                      Column(
                        children: [
                          dp.RangePicker(
                            selectedPeriod: dp.DatePeriod(startDate, endDate),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 30,)),
                            datePickerLayoutSettings: dp.DatePickerLayoutSettings(
                              showPrevMonthEnd: false,
                              showNextMonthStart: false,
                              hideMonthNavigationRow: false,
                          
                            ),
                            onChanged: (selectedRange) {
                              setState(() {
                                startDate = selectedRange.start;
                                endDate = selectedRange.end;
                              });
                            },
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ElevatedButton(
                              child: Text('Next'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectRooms(startDate: startDate, endDate: endDate),
                                  ),
                                );
                              },
                            ),
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