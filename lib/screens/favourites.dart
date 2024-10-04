import 'package:flutter/material.dart';
import 'restaurantmenu.dart'; // Assuming this is where your RestaurantMenu widget is defined
import 'profile.dart'; // Import the ProfilePage widget
import 'reservations.dart'; // Assuming you have a ReservationsPage widget
import 'theme_provider.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Restaurants'),
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.orangeAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const Text(
            'Your Favourite Restaurants',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          FavouriteRestaurantItem(
            image: 'assets/restaurant1.png',
            title: 'The Gourmet Kitchen',
            description: 'A fine dining experience like no other.',
          ),
          FavouriteRestaurantItem(
            image: 'assets/restaurant2.png',
            title: 'Chef\'s Delight',
            description: 'Innovative cuisine with an elegant ambiance.',
          ),
          // Add more favourite restaurants here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Reservations'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 2, // Set the current index to Favourites
        selectedItemColor: isDarkMode ? Colors.orangeAccent : Colors.black,
        unselectedItemColor: isDarkMode ? Colors.grey[500] : Colors.grey,
        backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RestaurantMenu(),
                ),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReservationsPage(),
                ),
              );
              break;
            case 2:
            // Already on the Favourites page
              break;
            case 3:
              Navigator.pushReplacement(
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

class FavouriteRestaurantItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const FavouriteRestaurantItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
