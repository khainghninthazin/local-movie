// import 'package:flutter/material.dart';


// class TabWidget extends StatefulWidget {
//   const TabWidget({super.key});

//   @override
//   State<TabWidget> createState() => _TabWidgetState();
// }

// class _TabWidgetState extends State<TabWidget> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   final List<Tab> myTabs = <Tab>[
//     const Tab(text: 'All'),
//     const Tab(text: 'Movies'),
//     const Tab(text: 'TV Shows'),
//     const Tab(text: 'Favorites'),
//   ];

//   final List<Widget> tabViews = <Widget>[
//     AllPageView(), // Replace with your actual AllPage view
//     Center(child: Text('Movies Page')), // Replace with actual Movies view
//     Center(child: Text('TV Shows Page')), // Replace with actual TV Shows view
//     Center(child: Text('Favorites Page')), // Replace with actual Favorites view
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(vsync: this, length: myTabs.length);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // TabBar
//         TabBar(
//           controller: _tabController,
//           tabs: myTabs,
//           indicatorColor: Colors.blue,
//           labelColor: Colors.white,
//           unselectedLabelColor: Colors.grey,
//         ),

//         // TabBarView
//         Expanded(
//           child: TabBarView(
//             controller: _tabController,
//             children: tabViews,
//           ),
//         ),
//       ],
//     );
//   }
// }
