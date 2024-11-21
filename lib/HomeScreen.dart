import 'package:flutter/material.dart';
import 'package:flutter_assessment/CartScreen.dart';
import 'package:flutter_assessment/DeatilsScreen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> shoes = [
    {
      'name': 'Nike Air Max',
      'price': 199.99,
      'image': 'assets/shoe.png',
      'rating': 4.8,
    },
    {
      'name': 'Nike Jordan',
      'price': 189.99,
      'image': 'assets/shoe.png',
      'rating': 4.9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: Container(
          color: const Color(0xFF1E1E1E),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Hey ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const Icon(
                              Icons.waving_hand,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ],
                        ),
                        const Text(
                          'User Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.person_outline, color: Colors.white70, size: 24),
                title: Text('Profile', style: TextStyle(color: Colors.white70, fontSize: 16)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.home_outlined, color: Colors.white70, size: 24),
                title: Text('Home Page', style: TextStyle(color: Colors.white70, fontSize: 16)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart_outlined, color: Colors.white70, size: 24),
                title: Text('My Cart', style: TextStyle(color: Colors.white70, fontSize: 16)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.favorite_outline, color: Colors.white70, size: 24),
                title: Text('Favorite', style: TextStyle(color: Colors.white70, fontSize: 16)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag_outlined, color: Colors.white70, size: 24),
                title: Text('Orders', style: TextStyle(color: Colors.white70, fontSize: 16)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.notifications_outlined, color: Colors.white70, size: 24),
                title: Text('Notifications', style: TextStyle(color: Colors.white70, fontSize: 16)),
                onTap: () {},
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white70, size: 24),
                title: Text('Sign Out', style: TextStyle(color: Colors.white70, fontSize: 16)),
                onTap: () {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Collection',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search shoes...',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final shoe = shoes[index % shoes.length];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(shoe: shoe),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: Hero(
                                  tag: 'shoe-${shoe['name']}',
                                  child: Image.asset(
                                    shoe['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shoe['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${shoe['price']}',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.amber,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '${shoe['rating']}',
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
