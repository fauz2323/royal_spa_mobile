import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_spa_garden_mobile/model/profile_model.dart';
import 'package:royal_spa_garden_mobile/views/profile/cubit/profile_cubit.dart';
import 'package:royal_spa_garden_mobile/widget/profile_menu_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..initial(),
      child: Builder(
        builder: (context) {
          return _build(context);
        },
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Container(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (user) => _loaded(context, user),
                error: (message) => Center(
                  child: Text(
                    'Error: $message',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            },
          )),
    );
  }

  Widget _loaded(BuildContext context, ProfileModel user) {
    return Column(
      children: [
        // Profile Header
        _buildProfileHeader(context, user),
        const SizedBox(height: 24),

        // Profile Menu Items
        _buildProfileMenuItems(context),
      ],
    );
  }

  Widget _buildProfileHeader(BuildContext context, ProfileModel user) {
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
          Text(
            user.data.user.name,
            style: const TextStyle(
              fontFamily: 'Hanken',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),

          // User Email
          Text(
            user.data.user.email,
            style: const TextStyle(
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
