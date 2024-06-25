import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            //Spacer(),
            // Icon(
            //   Icons.location_on,
            //   color: Colors.black,
            // ),
          ],
        ),
        title: Text(
          'Pune, India',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                "assets/images/profile.jpeg",
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 238, 130, 202),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Good morning, ',
              style:
                  TextStyle(fontSize: 22, color: Color.fromARGB(255, 0, 0, 0)),
              selectionColor: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Prashant.',
              style: TextStyle(
                  fontSize: 22, color: Color.fromARGB(255, 11, 10, 11)),
              selectionColor: Colors.black,
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Order groceries at the comfort of your home.",
              style: GoogleFonts.notoSerif(
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Fresh Items",
              style: GoogleFonts.notoSerif(
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () =>
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 156, 203, 239),
    );
  }
}
