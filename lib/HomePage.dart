import 'package:flutter/material.dart';
import 'package:practical4_hotel_booking/SearchPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.logoutAction,
  });

  final VoidCallback logoutAction;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of topdeals on hotels
  List<Map<String, String>> topDeals = [
    {
      'image': 'assets/images/Hotel.jpeg',
      'title': 'Saif Boutique Hotel International',
      'subtitle': 'SR 345.00',
      'tag': 'Start in 02:02:53',
    },
    {
      'image': 'assets/images/Hotel.jpeg',
      'title': 'Saif Boutique Hotel International',
      'subtitle': 'SR 345.00',
      'tag': 'Start in 03:00:00',
    },
    {
      'image': 'assets/images/Hotel.jpeg',
      'title': 'Saif Boutique Hotel International',
      'subtitle': 'SR 345.00',
      'tag': 'Start in 03:30:00',
    },
    {
      'image': 'assets/images/Hotel.jpeg',
      'title': 'Saif Boutique Hotel International',
      'subtitle': 'SR 345.00',
      'tag': 'Start in 03:53:00',
    },
  ];

  // list of recent booked hotels
  List<Map<String, String>> recentBooking = [
    {
      'image': 'assets/images/Hotel.jpeg',
      'title': 'Saif Boutique Hotel International',
      'tag': 'SR 127.50',
    },
    {
      'image': 'assets/images/Hotel.jpeg',
      'title': 'Saif Boutique Hotel International',
      'tag': 'SR 127.50',
    },
    {
      'image': 'assets/images/Hotel.jpeg',
      'title': 'Saif Boutique Hotel International',
      'tag': 'SR 127.50',
    },
  ];

  int _currentIndex = 0;
  FocusNode searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          // this ensures that the back button is not added automatically
          automaticallyImplyLeading: false,
          title: Text('HomeInn'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextField(
                    focusNode: searchFocus,
                    onTapOutside: (event) => searchFocus.unfocus(),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => SearchPage()),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    onTapAlwaysCalled: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Search by city, landmark, or hotel',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.orange.shade600,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        CustomRowForHotels(
                          title: 'Top Deals',
                          tagType: 1,
                          data: topDeals,
                        ),
                        CustomRowForHotels(
                          title: 'Recent Booking',
                          tagType: 2,
                          data: recentBooking,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'My Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              label: 'Share & Earn',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;

              if (value == 1) {
                // if profile icon has been clicked upon
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SizedBox(
                        width: 200,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'This will cause a log out action. Are you sure?'),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    child: Text('Confirm'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      widget.logoutAction();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.indigo.shade100,
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                        Colors.indigo.shade900,
                                      ),
                                    ),
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = 0;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            });
          },
        ),
      ),
    );
  }
}

// hotels row element
class CustomRowForHotels extends StatelessWidget {
  const CustomRowForHotels({
    super.key,
    required this.title,
    required this.tagType,
    required this.data,
  });

  final String title;
  final int tagType;
  final List<Map<String, String>> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // dynamically populating the data

              children: data.map<Widget>(
                (elem) {
                  return CustomCardDisplay(
                    tagType: tagType,
                    tagContent: elem['tag'] ?? 'tag',
                    image: elem['image'] ?? 'assets/images/Hotel.jpeg',
                    title: elem['title'] ?? 'title',
                    subtitle: elem['subtitle'] ?? '',
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// card display for each hotel
class CustomCardDisplay extends StatelessWidget {
  const CustomCardDisplay({
    super.key,
    required this.image,

    // this is the variable to
    // define the tag type
    required this.tagType,
    required this.tagContent,
    required this.title,
    this.subtitle = '',
  });

  final String image;
  final int tagType;
  final String tagContent;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12.0),
          ),
          width: screenWidth / 1.5,
          height: screenHeight / 4,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        image,
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: subtitle.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title),
                            Text(subtitle),
                          ],
                        )
                      : Text(title)),
            ],
          ),
        ),
        tagType == 1
            ? Positioned(
                top: 30,
                child: CustomHotelTag(
                  tagContent: tagContent,
                  tagType: tagType,
                ),
              )
            : Positioned(
                top: 8,
                right: 8,
                child: CustomHotelTag(
                  tagContent: tagContent,
                  tagType: tagType,
                ),
              ),
      ],
    );
  }
}

// custom element for the tag to show on the cards
class CustomHotelTag extends StatelessWidget {
  CustomHotelTag({
    super.key,
    required this.tagContent,
    required this.tagType,
  });
  final String tagContent;
  final int tagType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: tagType == 1 ? Colors.white : Colors.green,
        borderRadius: tagType == 1
            ? BorderRadius.circular(8.0)
            : BorderRadius.only(
                topRight: Radius.circular(8.0),
              ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 10.0,
      ),
      child: tagType == 1
          ? Row(
              children: [
                Icon(
                  Icons.timelapse_sharp,
                  color: Colors.green,
                ),
                Text(
                  tagContent,
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            )
          : Text(
              tagContent,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
    );
  }
}
