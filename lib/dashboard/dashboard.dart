import 'package:expense_tracker/dashboard/reportsection.dart';
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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        primaryColor: const Color(0xFF00BFB2),
        cardColor: const Color.fromARGB(255, 223, 223, 223),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.blue),
        ),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: _buildMainContent(context),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F7FA),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPendingTasksSection(),
              const SizedBox(height: 24),
              _buildRecentExpensesSection(),
              const SizedBox(height: 24),
              const Reportsection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPendingTasksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pending Tasks',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              _buildTaskItem(Colors.orange, Icons.check_circle_outline, 'Pending Approvals', '5'),
              _buildTaskItem(Colors.purple, Icons.flight, 'New Trips Registered', '1'),
              _buildTaskItem(Colors.red, Icons.receipt_long, 'Unreported Expenses', '4'),
              _buildTaskItem(Colors.teal, Icons.payment, 'Upcoming Payments', '0'),
              _buildTaskItem(Colors.blue, Icons.money, 'Unreported Advances', '€0.00'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTaskItem(Color color, IconData icon, String title, String count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Icon(
                icon,
                color: color,
                size: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(color: Colors.black87),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: count == '0' || count == '€0.00' ? Colors.grey.shade200 : color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count,
              style: TextStyle(
                color: count == '0' || count == '€0.00' ? Colors.grey : color,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentExpensesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Expenses',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Subject',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Employee',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Team',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Amount',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300, // Fixed height for scrolling
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildExpenseItem('Office Supplies', 'Kharl Almonguera', 'Marketing', 'P20150.00'),
                    _buildExpenseItem('Business Lunch', 'Ace Advincula', 'Sales', 'P2175.50'),
                    _buildExpenseItem('Travel Expenses', 'Shelou Asaria', 'Development', 'P10450.25'),
                    _buildExpenseItem('Client Dinner', 'Chrissandra Bautista', 'Marketing', 'P3320.00'),
                    _buildExpenseItem('Hotel', 'Crislyn Delgado', 'Finance', 'P4275.75'),
                    _buildExpenseItem('Software License', 'Airene Tungol', 'Development', 'P1199.99'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExpenseItem(String subject, String employee, String team, String amount) {
    Color teamColor;
    switch (team) {
      case 'Marketing':
        teamColor = Colors.blue;
        break;
      case 'Sales':
        teamColor = Colors.purple;
        break;
      case 'Development':
        teamColor = Colors.pink;
        break;
      case 'Finance':
        teamColor = Colors.teal;
        break;
      default:
        teamColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              subject,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
          Expanded(
            child: Text(
              employee,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: teamColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  team,
                  style: TextStyle(color: teamColor, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              amount,
              style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}