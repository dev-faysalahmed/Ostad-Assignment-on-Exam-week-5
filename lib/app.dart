import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_assignment_on_exam_week_5/screen/home_screen.dart';

class AssignmentExamWeek5 extends StatefulWidget {
  const AssignmentExamWeek5({super.key});

  @override
  State<AssignmentExamWeek5> createState() => _AssignmentExamWeek5State();
}

class _AssignmentExamWeek5State extends State<AssignmentExamWeek5> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
