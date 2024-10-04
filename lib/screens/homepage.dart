import 'package:flutter/material.dart';
import 'package:untitled4/screens/reservations.dart';
import 'restaurantmenu.dart'; // Assuming this is where your RestaurantMenu widget is defined
import 'profile.dart'; // Import the ProfilePage widget
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EPICIERGE'),
        backgroundColor: themeProvider.isDarkMode ? Colors.grey[900] : Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome to Epicierge!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Discover the finest dining experiences curated just for you. Whether you\'re in the mood for an exquisite gourmet meal or exploring new and elegant flavors, we\'ve got you covered. Bon appétit!',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search for a restaurant',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FilterButton(text: 'Offers'),
                  FilterButton(text: 'Rating'),
                  FilterButton(text: 'Price'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8.0,
                children: <Widget>[
                  FilterTag(text: 'Vegan'),
                  FilterTag(text: 'Gluten-Free'),
                  FilterTag(text: 'Popular'),
                  FilterTag(text: 'New'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Featured Restaurants',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FeaturedItem(
                    image: 'assets/spaghetti.png',
                    title: 'Ray\'s Kitchen',
                    description: 'Spaghetti Carbonara',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RestaurantMenu(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Reservations'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
            // Navigate to Home page (if needed)
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReservationsPage(),
                ),
              );
              break;
            case 2:
            // Navigate to Profile page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;

  const FilterButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: themeProvider.isDarkMode ? Colors.grey[700] : Colors.orangeAccent,
      ),
      child: Text(text),
    );
  }
}

class FilterTag extends StatelessWidget {
  final String text;

  const FilterTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Chip(
      label: Text(text),
      backgroundColor: themeProvider.isDarkMode ? Colors.grey[700] : Colors.orangeAccent,
    );
  }
}

class FeaturedItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback onTap;

  const FeaturedItem({super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: <Widget>[
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
