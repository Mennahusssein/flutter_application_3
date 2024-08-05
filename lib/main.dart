import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: CoffeeShopPage(),
    );
  }
}

class CoffeeShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
           child: Container(color: Color(0xFF2A2A2A),height: 350,
        
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30), // Space for status bar
        
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '   Location',
                      style: TextStyle(fontSize: 12, color: Color(0xFFA2A2A2)),
                    ),
                  ],
                ),
        
                const Row(
                  children: [
                    SizedBox(width: 4),
                    Text(
                      '  Bilzen, Tanjungbalai',
                      style: TextStyle(fontSize: 14, color: Color(0xFFD8D8D8)),
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Color(0xFFD8D8D8),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                 Row(
                  children: [
                    Container(
                      width: 1200, // Adjust the width as needed
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search,color: Colors.white,),
                          hintText: 'Search coffee',hintStyle: TextStyle(color: Color(0xFFA2A2A2)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Add some space between the TextField and the Image
                    Image.asset(
                      'images/Filet.png', // Replace with your image asset
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
               
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    //color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'images/ad.png',
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Image.asset("images/details.png", height: 100, width: 200)
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFC67C4E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    child:const Text(
                      'All Coffee',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,color: Colors.white
                      ),
                    ),),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Machiatto',
                            style:
                                TextStyle(color: Color(0xFF313131), fontSize: 14),
                          ),
                          SizedBox(width: 100),
                          Text(
                            'Latte',
                            style:
                                TextStyle(color: Color(0xFF313131), fontSize: 14),
                          ),
                          SizedBox(width: 100),
                          Text(
                            'Americano',
                            style:
                                TextStyle(color: Color(0xFF313131), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CoffeeItem(
                      image: 'assets/mocha.png',
                      name: 'Caffe Mocha',
                      description: 'Deep Foam',
                      price: 4.53,
                      rating: 4.8,
                    ),
                    CoffeeItem(
                      image: 'assets/flat_white.png',
                      name: 'Flat White',
                      description: 'Espresso',
                      price: 3.53,
                      rating: 4.8,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}

class CoffeeItem extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final double price;
  final double rating;

  CoffeeItem({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(image, width: 60, height: 60),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(description),
                Text('\$$price'),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    Text(rating.toString()),
                  ],
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              color: Color(0xFFC67C4E),
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
