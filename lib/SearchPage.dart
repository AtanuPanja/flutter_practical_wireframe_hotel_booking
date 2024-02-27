import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Icon(Icons.arrow_back),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Expanded(child: Text('Search')),
                ],
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
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.grey.shade300,),
                title: Text('Riyadh, Riyadh, Saudi Arabia'),
                onTap: () {
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
