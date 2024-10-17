// import 'package:flutter/material.dart';
// import 'package:destion_assesment_osman/views/HomePage/home_page.dart';

// class NavigationMenu extends StatefulWidget {
//   const NavigationMenu({super.key});

//   @override
//   State<NavigationMenu> createState() => _NavigationMenuState();
// }

// class _NavigationMenuState extends State<NavigationMenu> {
//   int currentIndex = 0;
//   late final List<Widget> screens;

//   @override
//   void initState() {
//     super.initState();
//     screens = const [
//       HomePage(),
//       HomePage(),
//       HomePage(),
//       HomePage(),
//       HomePage(),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: Stack(
//         children: [
//           screens.elementAt(currentIndex),
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: Align(
//               alignment: const Alignment(0.0, 1.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(30),
//                 child: BottomNavigationBar(
//                   currentIndex: currentIndex,
//                   onTap: (index) {
//                     setState(() {
//                       currentIndex = index;
//                     });
//                   }, // Set the background color to white
//                   selectedItemColor:
//                       Colors.red, // Use red for the selected item
//                   unselectedItemColor: Colors.grey, // Gray for unselected items
//                   selectedLabelStyle: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                   ), // Bold the selected label
//                   unselectedLabelStyle: const TextStyle(
//                     fontSize: 12,
//                   ),
//                   backgroundColor: Colors.black,
//                   items: const [
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.home_outlined),
//                       label: 'Home',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.favorite_border),
//                       label: 'Favorites',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.person_outline),
//                       label: 'Profile',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.shopping_cart_outlined),
//                       label: 'Cart',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
