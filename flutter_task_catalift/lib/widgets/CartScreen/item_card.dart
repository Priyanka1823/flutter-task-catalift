import 'package:flutter/material.dart';
import '../../models/course.dart';

class CartItemCard extends StatelessWidget {
  final Course course;
  final int index;
  final int quantity;
  final Function(int?) onQtyChanged;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.course,
    required this.index,
    required this.quantity,
    required this.onQtyChanged,
    required this.onRemove,
  });

  String getDeliveryDate() {
    final date = DateTime.now().add(const Duration(days: 4));
    return '${date.month}/${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(course.image, width: 110, height: 110, fit: BoxFit.cover),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text('₹${(course.price * 1.8).toStringAsFixed(0)}',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough, color: Colors.grey)),
                          const SizedBox(width: 6),
                          Text('₹${course.price.toStringAsFixed(0)}',
                              style: const TextStyle(fontSize: 16, color: Colors.green)),
                          const SizedBox(width: 6),
                          const Text('66% off', style: TextStyle(color: Colors.red, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text('Delivery by ${getDeliveryDate()} • FREE',
                          style: const TextStyle(color: Colors.green)),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Text('Qty: '),
                          DropdownButton<int>(
                            value: quantity,
                            items: List.generate(
                                10,
                                    (i) => DropdownMenuItem(
                                  value: i + 1,
                                  child: Text('${i + 1}'),
                                )),
                            onChanged: onQtyChanged,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete_outline, size: 13, color: Color(0xFF0D0D5B)),
                  label: const Text('Remove',
                      style: TextStyle(color: Color(0xFF0D0D5B), fontSize: 13)),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border, size: 13, color: Color(0xFF0D0D5B)),
                  label: const Text('Save for later',
                      style: TextStyle(color: Color(0xFF0D0D5B), fontSize: 13)),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.flash_on, size: 13, color: Color(0xFF0D0D5B)),
                  label: const Text('Buy now',
                      style: TextStyle(color: Color(0xFF0D0D5B), fontSize: 13)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
