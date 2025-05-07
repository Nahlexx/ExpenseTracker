import 'package:expense_tracker/dashboard/dashboard.dart';
import 'package:expense_tracker/intros/intro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storm Saver',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF0099FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: IntroductionPage(),
    );
  }
}

class HomehPage extends StatelessWidget{
  const HomehPage({super.key});

  @override 

   Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: Row(
              children: [
                _buildSidebar(context),
                Expanded(
                  child: DashboardPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.teal.withOpacity(0.2),
            radius: 18,
            child: const Text('S', style: TextStyle(color: Colors.teal)),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Storm Saver",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "Track your expenses",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 220,
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey.shade400, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.grey.shade600,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    final activeColor = Theme.of(context).primaryColor;
    return Container(
      width: 220, // Increased sidebar width for more padding
      color: Colors.white,
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          _buildUserProfile(),
          const SizedBox(height: 24),
          _buildNavItem(context, Icons.dashboard_outlined, 'Dashboard', isActive: true),
          _buildNavItem(context, Icons.receipt_outlined, 'Expenses', isActive: false),
          _buildNavItem(context, Icons.flight_outlined, 'Trips', isActive: false),
          _buildNavItem(context, Icons.approval_outlined, 'Approvals', isActive: false),
          _buildNavItem(context, Icons.settings_outlined, 'Settings', isActive: false),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24), // Increased padding
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/profile_pic.jpg'),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Josh Nimo',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                'View profile',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String title, {required bool isActive}) {
    final activeColor = Theme.of(context).primaryColor;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 4), // Increased left margin
      decoration: BoxDecoration(
        color: isActive ? activeColor.withOpacity(0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16), // Padding inside the ListTile
        leading: Icon(
          icon,
          color: isActive ? activeColor : Colors.grey,
          size: 20,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? activeColor : Colors.black87,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
        onTap: () {},
        dense: true,
        visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
      ),
    );
  }
}

