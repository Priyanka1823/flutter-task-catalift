class Course {
  final String title;
  final String image;
  final int lessons;
  final double price;

  Course({
    required this.title,
    required this.image,
    required this.lessons,
    required this.price,
  });
}

List<Course> sampleCourses = [
  Course(
    title: 'Artificial Intelligence and ML',
    image: 'assets/images/ai.jpeg',
    lessons: 15,
    price: 1500,
  ),
  Course(
    title: 'User Interface and User Experience',
    image: 'assets/images/wireframe.jpg',
    lessons: 15,
    price: 1500,
  ),
  Course(
    title: 'Computer Engineering',
    image: 'assets/images/computer.jpeg',
    lessons: 15,
    price: 1500,
  ),
];
