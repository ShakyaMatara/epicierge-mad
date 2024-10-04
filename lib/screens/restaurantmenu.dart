import 'package:flutter/material.dart';
import 'menuitem.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class RestaurantMenu extends StatelessWidget {
  const RestaurantMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ray\'s Kitchen Menu'),
        backgroundColor: themeProvider.isDarkMode ? Colors.grey[900] : Colors.orangeAccent,
      ),
      body: ListView(
        children: <Widget>[
          MenuItemCard(
            title: 'Gourmet Spaghetti',
            description: 'A delightful dish with rich flavors.',
            price: 24.99,
            onTap: () {
              navigateToMenuItem(context, 'Gourmet Spaghetti', 'A delightful dish with rich flavors.','assets/spaghetti.png', 24.99);
            },
          ),
          MenuItemCard(
            title: 'Truffle Risotto',
            description: 'Creamy risotto with truffle essence.',
            price: 29.99,
            onTap: () {
              navigateToMenuItem(context, 'Truffle Risotto', 'Creamy risotto with truffle essence.', 'assets/risotto.png', 29.99);
            },
          ),
          MenuItemCard(
            title: 'Lobster Bisque',
            description: 'Rich and creamy lobster soup.',
            price: 19.99,
            onTap: () {
              navigateToMenuItem(context, 'Lobster Bisque', 'Rich and creamy lobster soup.', 'assets/lobster_bisque.png', 19.99);
            },
          ),
          MenuItemCard(
            title: 'Filet Mignon',
            description: 'Tender beef steak cooked to perfection.',
            price: 39.99,
            onTap: () {
              navigateToMenuItem(context, 'Filet Mignon', 'Tender beef steak cooked to perfection.', 'assets/filet_mignon.png', 39.99);
            },
          ),
          MenuItemCard(
            title: 'Vegetarian Pizza',
            description: 'Freshly baked pizza with assorted vegetables.',
            price: 21.99,
            onTap: () {
              navigateToMenuItem(context, 'Vegetarian Pizza', 'Freshly baked pizza with assorted vegetables.', 'assets/vegetarian_pizza.png', 21.99);
            },
          ),
          MenuItemCard(
            title: 'Chocolate Lava Cake',
            description: 'Decadent chocolate cake with a molten center.',
            price: 9.99,
            onTap: () {
              navigateToMenuItem(context, 'Chocolate Lava Cake', 'Decadent chocolate cake with a molten center.', 'assets/chocolate_lava_cake.png', 9.99);
            },
          ),
          MenuItemCard(
            title: 'Caesar Salad',
            description: 'Classic salad with romaine lettuce and Caesar dressing.',
            price: 15.99,
            onTap: () {
              navigateToMenuItem(context, 'Caesar Salad', 'Classic salad with romaine lettuce and Caesar dressing.', 'assets/caesar_salad.png', 15.99);
            },
          ),
          MenuItemCard(
            title: 'Mango Sorbet',
            description: 'Refreshing sorbet made from ripe mangoes.',
            price: 7.99,
            onTap: () {
              navigateToMenuItem(context, 'Mango Sorbet','Refreshing sorbet made from ripe mangoes.', 'assets/mango_sorbet.png', 7.99);
            },
          ),
          // Add more MenuItemCard instances as needed
        ],
      ),
    );
  }

  void navigateToMenuItem(BuildContext context, String title, String description, String image, double price) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuItem(
          title: title,
          description: description,
          image: image,
          price: price,
        ),
      ),
    );
  }

  String getMenuDescription(String title) {
    // Add logic to return description based on the title if needed
    // For simplicity, returning placeholder text
    return 'Description for $title';
  }
}

class MenuItemCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final VoidCallback onTap;

  const MenuItemCard({super.key, 
    required this.title,
    required this.description,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
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
              const SizedBox(height: 8),
              Text('\$${price.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }
}
