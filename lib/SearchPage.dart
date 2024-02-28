import 'package:flutter/material.dart';

import 'SelectDateRange.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  // method to call in the next page, but passed as an argument here
  void customDateRangePicker() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    child: Icon(Icons.arrow_back),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text('Search')),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: 'Search by city, landmark, or hotel',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_searching_outlined),
                title: Text('Property Near Me'),
                contentPadding: EdgeInsets.zero,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.grey.shade400,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Riyadh, Riyadh, Saudi Arabia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'City',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                trailing: Text(
                  '1139',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.orange.shade600,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectDateRange(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
