import 'package:flutter/material.dart';

class HotelsAvailable extends StatefulWidget {
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
  State<HotelsAvailable> createState() => _HotelsAvailableState();
}

class _HotelsAvailableState extends State<HotelsAvailable> {
  int currentBottomNavigationIndex = 0;

  List<Map<String, String>> hotels = [
    {
      'image': 'assets/images/Hotel.jpeg',
      'name': 'Al Eairy Furnished Apartment - Riyadh 6',
      'location': 'Downtown Riyadh, Al Bathaa',
      'oneNightStayPrice': 'SR 111.00',
      'taxes': 'SR 19.84',
      'class': '3rd',
      'rooms': '3',
    },
    {
      'image': 'assets/images/Hotel.jpeg',
      'name': 'Altoot Palace 2',
      'location': 'Downtown Riyadh, Al Olaya',
      'oneNightStayPrice': 'SR 130.00',
      'taxes': 'SR 23.24',
      'class': '3rd',
      'rooms': '3',
    },
    {
      'image': 'assets/images/Hotel.jpeg',
      'name': 'Altoot Palace 2',
      'location': 'Downtown Riyadh, Al Olaya',
      'oneNightStayPrice': 'SR 130.00',
      'taxes': 'SR 23.24',
      'class': '3rd',
      'rooms': '3',
    },
    {
      'image': 'assets/images/Hotel.jpeg',
      'name': 'Al Eairy Furnished Apartment - Riyadh 6',
      'location': 'Downtown Riyadh, Al Bathaa',
      'oneNightStayPrice': 'SR 111.00',
      'taxes': 'SR 19.84',
      'class': '3rd',
      'rooms': '0',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(244, 255, 255, 255),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Riyadh, Riyadh, Saudi Arabia',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                Text(
                  widget.formattedDateString,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 20,
                    ),
                    Text(
                      '${widget.adultCount}',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.key,
                      size: 20,
                    ),
                    Text(
                      '${widget.roomCount}',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.sort),
            label: 'Sort',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_alt),
            label: 'Filter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
        ],
        currentIndex: currentBottomNavigationIndex,
        onTap: (value) {
          setState(() {
            currentBottomNavigationIndex = value;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: hotels
                .where((hotel) =>
                    hotel['rooms'] != null &&
                    int.parse(hotel['rooms'] ?? '0') >= widget.roomCount)
                .map<Widget>((hotel) {
              return CustomCardAvailableHotel(
                image: hotel['image'] ?? 'assets/images/Hotel.jpeg',
                name: hotel['name'] ?? 'Hotel Name',
                location: hotel['location'] ?? 'Hotel Location',
                oneNightStayPrice:
                    hotel['oneNightStayPrice'] ?? 'One Night Stay Price',
                taxes: hotel['taxes'] ?? 'Taxes and Charges',
                classTag: hotel['class'] ?? 'Some Class',
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class CustomCardAvailableHotel extends StatelessWidget {
  const CustomCardAvailableHotel({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.oneNightStayPrice,
    required this.taxes,
    required this.classTag,
  });

  final String image;
  final String name;
  final String location;
  final String oneNightStayPrice;
  final String taxes;
  final String classTag;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth / 1.2,
      height: screenHeight / 2,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(33, 0, 0, 0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          width: screenWidth / 2,
                        ),
                        Text(location),
                        // Text('1 night stay: $oneNightStayPrice'),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: '1 night stay: '),
                              TextSpan(
                                text: oneNightStayPrice,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '+ $taxes taxes and charges',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '$classTag class',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              child: Icon(
                Icons.favorite_border,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
