import 'package:assignment/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
      ),


      drawer: MyDrawer(),
      // Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text(
      //           'Profile',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('User Name'),
      //         onTap: () {
      //           // Add your action here
      //         },
      //       ),
      //       ListTile(
      //         title: Text('User Details'),
      //         onTap: () {
      //           // Add your action here
      //         },
      //       ),
      //     ],
      //   ),
      // ),


      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // Wide layout (e.g. tablet, desktop)
              return buildWideLayout();
            } else {
              // Narrow layout (e.g. mobile)
              return buildNarrowLayout();
            }
          },
        ),
      ),
    );
  }

  Widget buildWideLayout() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Booking details...',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action when confirming booking
                  // You can add your logic here
                  print('Booking confirmed');
                },
                child: Text('Confirm'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action when rejecting booking
                  // You can add your logic here
                  print('Booking rejected');
                },
                child: Text('Reject'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildNarrowLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Booking details...',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Action when confirming booking
            // You can add your logic here
            print('Booking confirmed');
          },
          child: Text('Confirm'),
        ),
        ElevatedButton(
          onPressed: () {
            // Action when rejecting booking
            // You can add your logic here
            print('Booking rejected');
          },
          child: Text('Reject'),
        ),
      ],
    );
  }
}
