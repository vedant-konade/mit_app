import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth >
              800; // Check for large screens (like tablets and desktops)

          return Row(
            children: [
              // Sidebar
              if (isWideScreen)
                Container(
                  width: 250,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Sidebar top
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "YourApp",
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple[900],
                              ),
                            ),
                          ),
                          _buildSidebarItem(
                            icon: Icons.dashboard,
                            label: 'Dashboard',
                            isSelected: true,
                          ),
                          _buildSidebarItem(
                            icon: Icons.note_alt,
                            label: 'Notes',
                            isSelected: false,
                          ),
                          _buildSidebarItem(
                            icon: Icons.assignment,
                            label: 'Assignments',
                            isSelected: false,
                          ),
                          _buildSidebarItem(
                            icon: Icons.quiz,
                            label: 'Assessments',
                            isSelected: false,
                          ),
                        ],
                      ),
                      // Sidebar bottom
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            _buildSidebarItem(
                              icon: Icons.settings,
                              label: 'Settings',
                              isSelected: false,
                            ),
                            SizedBox(height: 10),
                            _buildSidebarItem(
                              icon: Icons.logout,
                              label: 'Logout',
                              isSelected: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              // Main Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dashboard",
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[900],
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey[300],
                            child:
                                Icon(Icons.person, color: Colors.purple[900]),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Top Banner Section
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [Colors.purple, Colors.pink],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Welcome to Your Dashboard!",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 20),

                      // Cards Section
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: isWideScreen
                              ? 3
                              : 2, // Adjust number of columns based on screen size
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: [
                            _buildFeatureCard(
                              title: 'Notes',
                              icon: Icons.note_alt,
                              color: Colors.indigo,
                              onTap: () {
                                Navigator.pushNamed(context, '/notes');
                              },
                            ),
                            _buildFeatureCard(
                              title: 'Assignments',
                              icon: Icons.assignment,
                              color: Colors.teal,
                              onTap: () {
                                Navigator.pushNamed(context, '/assignments');
                              },
                            ),
                            _buildFeatureCard(
                              title: 'Assessments',
                              icon: Icons.quiz,
                              color: Colors.orange,
                              onTap: () {
                                Navigator.pushNamed(context, '/assessments');
                              },
                            ),
                            _buildFeatureCard(
                              title: 'Leaderboard',
                              icon: Icons.leaderboard,
                              color: Colors.purple,
                              onTap: () {
                                Navigator.pushNamed(context, '/leaderboard');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSidebarItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.purple[900] : Colors.grey,
          ),
          SizedBox(width: 10),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.purple[900] : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
