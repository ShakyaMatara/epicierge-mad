import 'package:flutter/material.dart';
import 'package:untitled4/screens/reservations.dart';
import 'restaurantmenu.dart'; // Assuming this is where your RestaurantMenu widget is defined
import 'profile.dart'; // Import the ProfilePage widget
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'favourites.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDarkMode = themeProvider.isDarkMode;  // Fix: added isDarkMode variable here

    return Scaffold(
      appBar: AppBar(
        title: const Text('EPICIERGE'),
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.orangeAccent, // Background color based on dark mode
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
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0, // Set the current index to default to Home
        selectedItemColor: isDarkMode ? Colors.orangeAccent : Colors.black, // Color for selected item based on dark mode
        unselectedItemColor: isDarkMode ? Colors.grey[500] : Colors.grey, // Color for unselected items
        backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white, // Background color of BottomNavigationBar
        onTap: (index) {
          switch (index) {
            case 0:
            // Navigate to Home page
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavouritesPage(),
                ),
              );
              break;
            case 3:
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
        backgroundColor: themeProvider.isDarkMode ? Colors.grey[700] : Colors.orangeAccent, // Button color based on dark mode
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
      backgroundColor: themeProvider.isDarkMode ? Colors.grey[700] : Colors.orangeAccent, // Chip color based on dark mode
    );
  }
}

class FeaturedItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback onTap;

  const FeaturedItem({
    super.key,
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
