import 'package:flutter/material.dart';
import '../../model/service_spa_model.dart';

class BookingPageView extends StatefulWidget {
  const BookingPageView({super.key});

  @override
  State<BookingPageView> createState() => _BookingPageViewState();
}

class _BookingPageViewState extends State<BookingPageView> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();
  final _timeController = TextEditingController();

  Datum? _selectedService;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _notesController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Book Spa Service',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Service Selection Card
              _buildSectionTitle('Spa Service'),
              const SizedBox(height: 12),
              // _buildServiceSelectionCard(),

              const SizedBox(height: 24),

              // Date Selection
              _buildSectionTitle('Select Date'),
              const SizedBox(height: 12),
              _buildDateSelectionCard(),

              const SizedBox(height: 24),

              // Time Selection
              _buildSectionTitle('Select Time'),
              const SizedBox(height: 12),
              _buildTimeSelectionCard(),

              const SizedBox(height: 24),

              // Notes Section
              _buildSectionTitle('Additional Notes (Optional)'),
              const SizedBox(height: 12),
              _buildNotesField(),

              const SizedBox(height: 32),

              // Book Now Button
              _buildBookNowButton(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildDateSelectionCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: _selectDate,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.blue[600],
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    _selectedDate != null
                        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                        : 'Select Date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _selectedDate != null
                          ? Colors.black87
                          : Colors.grey[600],
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSelectionCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: _timeController,
        decoration: InputDecoration(
          hintText: 'Enter time (e.g., 14:30)',
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: Container(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                Icons.access_time,
                color: Colors.orange[600],
                size: 16,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter service time';
          }

          // Validate time format (HH:mm)
          final timeRegex = RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
          if (!timeRegex.hasMatch(value)) {
            return 'Please enter time in HH:mm format (e.g., 14:30)';
          }

          return null;
        },
      ),
    );
  }

  Widget _buildNotesField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: _notesController,
        maxLines: 4,
        maxLength: 1000,
        decoration: InputDecoration(
          hintText: 'Add any special requests or notes...',
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16),
          counterStyle: TextStyle(color: Colors.grey[500]),
        ),
        validator: (value) {
          if (value != null && value.length > 1000) {
            return 'Notes must not exceed 1000 characters';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildBookNowButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isFormValid() ? _submitBooking : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink[300],
          disabledBackgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Book Now',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  bool _isFormValid() {
    return _selectedService != null &&
        _selectedDate != null &&
        _timeController.text.isNotEmpty;
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.pink[300]!,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showServiceSelectionDialog() {
    // In a real app, you would fetch services from API
    // For now, we'll show a placeholder dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Spa Service'),
        content: const Text(
          'Service selection will be implemented with API integration. '
          'For now, please select from available services.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _submitBooking() {
    if (_formKey.currentState!.validate() && _isFormValid()) {
      // Use time directly from text field
      final timeString = _timeController.text;

      // Format date to YYYY-MM-DD format for backend
      final dateString =
          '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}';

      // Prepare booking data according to validation rules
      final bookingData = {
        'spa_services_id': _selectedService!.id,
        'time_service': timeString,
        'date_service': dateString,
        'notes':
            _notesController.text.isNotEmpty ? _notesController.text : null,
      };

      // Show confirmation dialog
      _showBookingConfirmation(bookingData);
    }
  }

  void _showBookingConfirmation(Map<String, dynamic> bookingData) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Booking'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service: ${_selectedService!.name}'),
            Text('Date: ${bookingData['date_service']}'),
            Text('Time: ${bookingData['time_service']}'),
            if (bookingData['notes'] != null)
              Text('Notes: ${bookingData['notes']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Here you would submit to API
              _showSuccessMessage();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink[300],
            ),
            child: const Text('Confirm', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Booking submitted successfully!'),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
