import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_spa_garden_mobile/network/auth_network.dart';

import '../../model/profile_model.dart';
import '../../utils/token_utils.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  final _authNetwork = AuthNetwork();
  String token = '';
  User? user;

  @override
  void initState() {
    super.initState();
    _fetchToken();
  }

  void _fetchToken() async {
    token = await TokenUtils.getToken() ?? '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    user = ModalRoute.of(context)!.settings.arguments as User;
    _loadCurrentProfile();
  }

  void _loadCurrentProfile() {
    _nameController.text = user?.name ?? '';
    _emailController.text = user?.email ?? '';
    _phoneController.text = user?.phone ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(
            fontSize: 20,
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Personal Information Section
              _buildSectionHeader('Personal Information'),
              const SizedBox(height: 16),
              _buildPersonalInfoCard(),
              const SizedBox(height: 24),
              // Save Button
              _buildSaveProfileButton(),
              const SizedBox(height: 24),

              // Change Password Section
              _buildSectionHeader('Change Password'),
              const SizedBox(height: 16),
              _buildPasswordCard(),
              const SizedBox(height: 32),

              // Save Button
              _buildSaveButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildPersonalInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Name Field
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Full Name',
              hintText: 'Enter your full name',
              prefixIcon: const Icon(Icons.person_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(166, 138, 100, 1)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              if (value.length < 2) {
                return 'Name must be at least 2 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Email Field
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(166, 138, 100, 1)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (value.length < 2) {
                return 'Name must be at least 2 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Phone Number Field
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(15),
            ],
            decoration: InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Enter your phone number',
              prefixIcon: const Icon(Icons.phone_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(166, 138, 100, 1)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              if (value.length < 10) {
                return 'Phone number must be at least 10 digits';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Current Password Field
          TextFormField(
            controller: _currentPasswordController,
            obscureText: _obscureCurrentPassword,
            decoration: InputDecoration(
              labelText: 'Current Password',
              hintText: 'Enter your current password',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureCurrentPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _obscureCurrentPassword = !_obscureCurrentPassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(166, 138, 100, 1)),
              ),
            ),
            validator: (value) {
              if (_newPasswordController.text.isNotEmpty &&
                  (value == null || value.isEmpty)) {
                return 'Please enter your current password to change password';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // New Password Field
          TextFormField(
            controller: _newPasswordController,
            obscureText: _obscureNewPassword,
            decoration: InputDecoration(
              labelText: 'New Password',
              hintText: 'Enter new password (optional)',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureNewPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _obscureNewPassword = !_obscureNewPassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(166, 138, 100, 1)),
              ),
            ),
            validator: (value) {
              if (value != null && value.isNotEmpty && value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                // Force rebuild to update confirm password validation
              });
            },
          ),
          const SizedBox(height: 20),

          // Confirm New Password Field
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _obscureConfirmPassword,
            decoration: InputDecoration(
              labelText: 'Confirm New Password',
              hintText: 'Confirm your new password',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(166, 138, 100, 1)),
              ),
            ),
            validator: (value) {
              if (_newPasswordController.text.isNotEmpty) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your new password';
                }
                if (value != _newPasswordController.text) {
                  return 'Passwords do not match';
                }
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSaveProfileButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _saveProfile,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(166, 138, 100, 1),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: _isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              'Save Profile',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _savePassword,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(166, 138, 100, 1),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: _isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              'Save Changes',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }

  void _saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await _authNetwork.updateProfile(
        token: token,
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
      );

      if (mounted) {
        result.fold(
          (error) => _showSnackBar(error.message),
          (_) {
            _showSnackBar('Profile updated successfully', isSuccess: true);
          },
        );
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('Failed to update profile. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _savePassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    if (_newPasswordController.text != _confirmPasswordController.text) {
      setState(() {
        _isLoading = false;
      });
      _showSnackBar('Password Baru dan Konfirmasi Password Baru tidak cocok');
    }

    try {
      final result = await _authNetwork.updatePassword(
        token: token,
        current_password: _currentPasswordController.text,
        new_password: _newPasswordController.text,
      );

      if (mounted) {
        result.fold(
          (error) => _showSnackBar(error.message),
          (_) {
            _showSnackBar('Profile updated successfully', isSuccess: true);
          },
        );
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('Failed to update password. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showSnackBar(String message, {bool isSuccess = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
