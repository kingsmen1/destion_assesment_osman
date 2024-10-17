import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Laptop Mahal',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          actions: [
            IconButton(
              icon:
                  const Icon(Icons.notifications_outlined, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Shipping location bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const Icon(Icons.location_on,
                        color: Colors.black, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      'Ships to Plemahan, Surabaya',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  ],
                ),
              ),
              // Banner ad
              Container(
                margin: const EdgeInsets.all(16.0),
                height: 150,
                child: Image.asset('assets/images/iphone-16-pro-banner.jpg',
                    fit: BoxFit.cover),
              ),
              // Tab section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: const [
                    TabItem(label: 'All', selected: true),
                    TabItem(label: 'iPhone'),
                    TabItem(label: 'iPad'),
                    TabItem(label: 'Macbook'),
                  ],
                ),
              ),
              // Countdown and product grid
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ramadhan Sales',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    CountdownWidget(),
                  ],
                ),
              ),
              // Product items
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ProductCard(
                      title: 'iPhone 13 Mini 128 GB',
                      price: 'IDR 10.000.000',
                      cashback: '15%',
                      rating: '5.0',
                      sold: '666 Sold',
                      imageUrl: 'assets/images/iphone-16-pro1.png',
                    ),
                    ProductCard(
                      title: 'Apple Watch S8',
                      price: 'IDR 3.500.000',
                      discount: '20%',
                      rating: '4.8',
                      sold: '600 Sold',
                      imageUrl: 'assets/images/watch-ultra2.jpeg',
                    ),
                  ],
                ),
              ),
              // Recommendations section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Recommendation for you',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              // Example product recommendation grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    ProductCard(
                      title: 'Macbook Pro',
                      price: 'IDR 30.000.000',
                      imageUrl: 'assets/images/macbook-pro.jpeg',
                    ),
                    ProductCard(
                      title: 'AirPods',
                      price: 'IDR 3.000.000',
                      imageUrl: 'assets/images/airpods.jpeg',
                    ),
                    // Add more products as necessary
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Countdown widget for the sales timer
class CountdownWidget extends StatelessWidget {
  const CountdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        TimeBox(value: '10'),
        Text(':'),
        TimeBox(value: '11'),
        Text(':'),
        TimeBox(value: '01'),
      ],
    );
  }
}

class TimeBox extends StatelessWidget {
  final String value;

  const TimeBox({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black,
      ),
      child: Text(
        value,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Tab Item Widget
class TabItem extends StatelessWidget {
  final String label;
  final bool selected;

  const TabItem({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selected ? Colors.black : Colors.transparent,
        border: Border.all(color: selected ? Colors.black : Colors.grey),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }
}

// Product Card Widget
class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String? cashback;
  final String? discount;
  final String rating;
  final String sold;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    this.cashback,
    this.discount,
    this.rating = '',
    this.sold = '',
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(imageUrl, height: 120, fit: BoxFit.cover),
              if (cashback != null)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.blue,
                    child: Text(
                      'Cashback $cashback',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              if (discount != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.red,
                    child: Text(
                      'Discount $discount',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.star, size: 14, color: Colors.yellow[800]),
              Text(
                rating,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              Text(
                sold,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
