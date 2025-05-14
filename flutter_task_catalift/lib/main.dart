import 'package:flutter/material.dart';
import 'screens/course_details_screen.dart';
import 'models/course.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Details',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Arial'),
      home: CourseDetailsScreen(course: sampleCourses[0]),
    );
  }
}
