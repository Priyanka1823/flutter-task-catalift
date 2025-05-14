import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/CartScreen/item_card.dart';
import '../widgets/CartScreen/price_details.dart';

class CartScreen extends StatefulWidget {
  final List<Course> cartCourses;

  const CartScreen({super.key, required this.cartCourses});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Map<int, int> quantityMap = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.cartCourses.length; i++) {
      quantityMap[i] = 1;
    }
  }

  double getTotalPriceBeforeDiscount() =>
      widget.cartCourses.fold(0, (sum, item) => sum + item.price * 1.8);

  double getDiscountAmount() {
    double discount = 0;
    for (int i = 0; i < widget.cartCourses.length; i++) {
      final course = widget.cartCourses[i];
      final qty = quantityMap[i] ?? 1;
      discount += (course.price * 1.8 - course.price) * qty;
    }
    return discount;
  }

  double getTotalAmount() {
    double total = 0;
    for (int i = 0; i < widget.cartCourses.length; i++) {
      total += widget.cartCourses[i].price * (quantityMap[i] ?? 1);
    }
    return total + 3;
  }

  @override
  Widget build(BuildContext context) {
    final totalSaved = getDiscountAmount() + 12;

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: widget.cartCourses.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: widget.cartCourses.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final course = widget.cartCourses[index];
                return CartItemCard(
                  course: course,
                  index: index,
                  quantity: quantityMap[index] ?? 1,
                  onQtyChanged: (val) => setState(() {
                    quantityMap[index] = val ?? 1;
                  }),
                  onRemove: () => setState(() {
                    widget.cartCourses.removeAt(index);
                    quantityMap.remove(index);
                  }),
                );
              },
            ),
            const SizedBox(height: 120),
            Container(
              width: double.infinity,
              color: Colors.green.shade50,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                '✅ You\'ll save ₹${totalSaved.toStringAsFixed(0)} on this order!',
                style: const TextStyle(color: Colors.green, fontSize: 14),
              ),
            ),
            const SizedBox(height: 4),
            PriceDetails(
              itemCount: widget.cartCourses.length,
              totalBeforeDiscount: getTotalPriceBeforeDiscount(),
              discount: getDiscountAmount(),
              total: getTotalAmount(),
            ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          width: double.infinity,
          color: Colors.white,
          child: ElevatedButton(
            onPressed: () {
              // Place order action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0D0D5B),
              minimumSize: const Size.fromHeight(45),
            ),
            child: const Text('Place Order', style: TextStyle(color: Colors.white)),
          ),
        )
          ],
        ),
      ),
    );
  }
}
