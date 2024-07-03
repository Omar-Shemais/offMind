import 'package:adhd/Features/home/presentation/views/widgets/successfuly_booked.dart';
import 'package:adhd/Features/home/presentation/views/widgets/time_btn.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_button.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SetApointmentViewBody extends StatefulWidget {
  const SetApointmentViewBody({super.key});

  @override
  State<SetApointmentViewBody> createState() => _SetApointmentViewBodyState();
}

class _SetApointmentViewBodyState extends State<SetApointmentViewBody> {
  DateTime today = DateTime.now();
  void _onSelectedDate(DateTime day, DateTime foucasDay) {
    setState(() {
      today = day;
    });
  }

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
             RouteUtils.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new,color: AppColors.darkGray,)),
        title: const AppText(
          title: 'Select date and time',
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'Assets/Images/background1.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.height),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.width),
                    child: TableCalendar(
                      locale: 'en_us',
                      rowHeight: 50,
                      headerStyle: const HeaderStyle(
                          formatButtonVisible: false, titleCentered: true),
                      availableGestures: AvailableGestures.all,
                      calendarStyle: const CalendarStyle(
                        todayDecoration: BoxDecoration(
                            color: AppColors.blue, shape: BoxShape.circle),
                        selectedDecoration: BoxDecoration(
                            color: AppColors.blue, shape: BoxShape.circle),
                        defaultTextStyle: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        outsideTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGray,
                            fontSize: 18),
                        todayTextStyle: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        weekendTextStyle: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        disabledTextStyle:
                            TextStyle(color: AppColors.darkGray, fontSize: 18),
                        selectedTextStyle: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      selectedDayPredicate: (day) => isSameDay(day, today),
                      focusedDay: today,
                      firstDay: DateTime.utc(2024, 2, 20),
                      lastDay: DateTime.utc(2030, 12, 31),
                      onDaySelected: _onSelectedDate,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.width, top: 40.height),
                    child: const Row(
                      children: [
                        AppText(
                          title: 'Available Time Slot',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeBtn(
                        btnText: '10:00 AM',
                        color: _isSelected ? AppColors.blue : AppColors.gray,
                        onTap: () {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10.width,
                      ),
                      TimeBtn(
                        btnText: '12:00 PM',
                        color: _isSelected ? AppColors.gray : AppColors.blue,
                        onTap: () {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.height,
                  ),
                  CustomButton(
                    btnText: 'Book An Appointment',
                    onTap: () {
                      RouteUtils.push( const SuccessfulyBooked());
                    },
                    // route: AppRouter.kSuccessfulyBooked,
                    width: 200.width,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
