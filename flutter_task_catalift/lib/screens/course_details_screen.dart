import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/CourseDetail/category.dart';
import '../widgets/CourseDetail/course_card.dart';
import 'cart_screen.dart';
import '../models/cart_manager.dart';

class CourseDetailsScreen extends StatefulWidget {
  final Course course;



  const CourseDetailsScreen({super.key, required this.course});

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  bool isBookmarked = false;
  void addToCart(Course course) {
    String message;

    if (!cartCourses.contains(course)) {
      cartCourses.add(course);
      message = "Item added to cart!";
    }
    else {
      message = "Item is already in cart!";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green[600],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF0D0D5B);
    final course = widget.course;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  course.image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 16,
                  left: 16,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: primaryColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Course Details",
                        style: TextStyle(
                          color: Color(0xFF0D0D5B),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 16,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.bookmark_border, color: primaryColor),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.shopping_cart_outlined),
                          color: primaryColor,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(cartCourses: cartCourses),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                            color: isBookmarked ? Colors.amber : primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              isBookmarked = !isBookmarked;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Highly Enrolled',
                      style: TextStyle(color: Colors.green[800]),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D0D5B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text('4.5', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 8),
                      Text('| 8,374 Enrolled', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₹${course.price}', // Use course price
                    style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'This course offers a comprehensive introduction to Artificial Intelligence and Machine Learning. Learn fundamental concepts such as supervised and unsupervised learning, neural networks, natural language processing, and model evaluation techniques.....',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            addToCart(course);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: primaryColor,
                            side: BorderSide(color: primaryColor),
                          ),
                          child: const Text('Add To Cart'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                          child: const Text('Buy Now',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Similar Courses',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 36,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CategoryChip(label: 'All', isSelected: true),
                        CategoryChip(label: 'AI & ML'),
                        CategoryChip(label: 'Product'),
                        CategoryChip(label: 'Sales'),
                        CategoryChip(label: 'Public Speaking'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sampleCourses.length,
                      itemBuilder: (context, index) {
                        return CourseCard(course: sampleCourses[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
