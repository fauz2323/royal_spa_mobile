import 'package:flutter/material.dart';
import 'package:royal_spa_garden_mobile/widget/profile_menu_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Hanken',
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Header
            _buildProfileHeader(context),
            const SizedBox(height: 24),

            // Profile Menu Items
            _buildProfileMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Profile Picture
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE8F5E8),
              border: Border.all(
                color: const Color(0xFF4CAF50),
                width: 3,
              ),
            ),
            child: const Icon(
              Icons.person,
              size: 50,
              color: Color(0xFF4CAF50),
            ),
          ),
          const SizedBox(height: 16),

          // User Name
          const Text(
            'John Doe',
            style: TextStyle(
              fontFamily: 'Hanken',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),

          // User Email
          const Text(
            'john.doe@example.com',
            style: TextStyle(
              fontFamily: 'Hanken',
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),

          // Edit Profile Button
          GestureDetector(
            onTap: () {
              // Navigate to edit profile page
              Navigator.pushNamed(context, '/edit_profile');
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontFamily: 'Hanken',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenuItems(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ProfileMenuWidget(
            isLogout: false,
            icon: Icons.history,
            title: 'Booking History',
            subtitle: 'View your past appointments',
            onTap: () {
              // Navigate to booking history
              Navigator.pushNamed(context, '/history');
            },
          ),
          _buildDivider(),
          ProfileMenuWidget(
            isLogout: false,
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Manage your notifications',
            onTap: () {
              // Navigate to notifications settings
            },
          ),
          _buildDivider(),
          ProfileMenuWidget(
            isLogout: false,
            icon: Icons.help,
            title: 'Help & Support',
            subtitle: 'Get help and contact support',
            onTap: () {
              // Navigate to help and support
              Navigator.pushNamed(context, '/qna');
            },
          ),
          _buildDivider(),
          ProfileMenuWidget(
            isLogout: false,
            icon: Icons.info,
            title: 'About',
            subtitle: 'App version and information',
            onTap: () {
              // Navigate to about page
              Navigator.pushNamed(context, '/about');
            },
          ),
          _buildDivider(),
          ProfileMenuWidget(
            isLogout: true,
            icon: Icons.logout,
            title: 'Logout',
            subtitle: 'Sign out of your account',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        height: 1,
        color: Colors.grey[200],
      ),
    );
  }
}
