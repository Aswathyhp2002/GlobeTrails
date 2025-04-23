import 'package:flutter/material.dart';

class HotelBookingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              // Title
              Text(
                "Book your Hotel",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),

              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search Hotels",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.filter_list, color: Colors.grey[600]),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Filter Buttons
              Row(
                children: [
                  buildTabButton("Nearest", isSelected: true),
                  buildTabButton("Popular"),
                  buildTabButton("Top Rates"),
                ],
              ),

              SizedBox(height: 15),

              // Horizontal Scrollable Hotel List
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildHotelCard("Hotel Osaka, Tokyo", "Tokyo, Japan", "assets/hotel1.jpg", "4.8"),
                    buildHotelCard("Luxury Resort", "Dubai, UAE", "assets/hotel2.jpg", "4.7"),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Recommended Hotels Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Hotels",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ],
              ),

              SizedBox(height: 15),

              // Horizontal Scrollable Recommended Hotels
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildRecommendedHotel("assets/hotel3.jpg"),
                    buildRecommendedHotel("assets/hotel4.jpg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hotel Card Widget
  Widget buildHotelCard(String name, String location, String imagePath, String rating) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 14),
                    Text(location, style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  Text(rating, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Recommended Hotel Widget
  Widget buildRecommendedHotel(String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 140,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Tab Button Widget
  Widget buildTabButton(String text, {bool isSelected = false}) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.black : Colors.grey[300],
          foregroundColor: isSelected ? Colors.white : Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(text),
      ),
    );
  }
}
