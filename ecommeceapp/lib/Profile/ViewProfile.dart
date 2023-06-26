import 'package:ecommeceapp/Profile/proile_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ViewProfileScreen extends StatelessWidget {
  final Box<Profile> _profileBox = Hive.box<Profile>('profileBox');

  @override
  Widget build(BuildContext context) {
    final profile = _profileBox.get(0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('View Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              SizedBox(height: 20),
              _buildDetailItem('Full Name', profile?.fullName ?? ''),
              SizedBox(height: 10),
              _buildDetailItem('Email', profile?.email ?? ''),
              SizedBox(height: 10),
              _buildDetailItem('Phone Number', profile?.phoneNumber ?? ''),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
