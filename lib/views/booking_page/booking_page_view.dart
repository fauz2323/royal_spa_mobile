import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_spa_garden_mobile/model/service_spa_detail_model.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';
import 'package:royal_spa_garden_mobile/views/booking_page/cubit/booking_page_cubit.dart';
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
  late String serviceId;

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
    serviceId = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => BookingPageCubit()..initial(serviceId),
      child: Builder(
        builder: (context) {
          return _build(context);
        },
      ),
    );
  }

  Widget _build(BuildContext context) {
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
        body: BlocConsumer<BookingPageCubit, BookingPageState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {},
                unauthorized: () async {
                  await TokenUtils.deleteAllTokens();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login', (route) => false);
                  // Handle unauthorized state, e.g., navigate to login
                });
          },
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (data, date, time) => _loaded(context, data, date, time),
              error: (message) => Center(
                child: Text(
                  'Error: $message',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              unauthorized: () => const SizedBox.shrink(),
              success: () => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 100,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Booking Successful!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your spa service has been booked successfully.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/home', (route) => false);
                      },
                      child: const Text('Back to Home'),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget _loaded(BuildContext context, ServiceSpaDetailModel data,
      DateTime? selectedDate, TimeOfDay? selectedTime) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Selection Card
            _buildSectionTitle('Spa Service'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
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
              child: Text(data.data.name,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87)),
            ),

            const SizedBox(height: 24),

            // Date Selection
            _buildSectionTitle('Select Date'),
            const SizedBox(height: 12),
            _buildDateSelectionCard(context, selectedDate),

            const SizedBox(height: 24),

            // Time Selection
            _buildSectionTitle('Select Time'),
            const SizedBox(height: 12),
            _buildTimeSelectionCard(context, selectedTime),

            const SizedBox(height: 24),

            // Notes Section
            _buildSectionTitle('Additional Notes (Optional)'),
            const SizedBox(height: 12),
            _buildNotesField(),

            const SizedBox(height: 32),

            // Book Now Button
            _buildBookNowButton(context),

            const SizedBox(height: 20),
          ],
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

  Widget _buildDateSelectionCard(BuildContext context, DateTime? selectedDate) {
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
          onTap: () {
            _selectDate().then((pickedDate) {
              if (pickedDate != null) {
                context.read<BookingPageCubit>().setDate(pickedDate);
              }
            });
          },
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
                    selectedDate != null
                        ? selectedDate.toLocal().toString().split(' ')[0]
                        : 'Select Date',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
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

  Widget _buildTimeSelectionCard(
      BuildContext context, TimeOfDay? selectedTime) {
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
          onTap: () {
            _selectTime(context).then((pickedTime) {
              if (pickedTime != null) {
                context.read<BookingPageCubit>().setTime(pickedTime);
              }
            });
          },
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
                    selectedTime != null
                        ? selectedTime.format(context)
                        : 'Select Time',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
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

  Widget _buildBookNowButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final notes = _notesController.text;
            context.read<BookingPageCubit>().submitData(notes);
          }
        },
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

  Future<DateTime?> _selectDate() async {
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

    if (picked != null) {
      return picked;
    }
    return null;
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      return picked;
    }
    return null;
  }
}
