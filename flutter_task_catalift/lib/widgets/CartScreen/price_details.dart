import 'package:flutter/material.dart';

class PriceDetails extends StatelessWidget {
  final int itemCount;
  final double totalBeforeDiscount;
  final double discount;
  final double total;

  const PriceDetails({
    super.key,
    required this.itemCount,
    required this.totalBeforeDiscount,
    required this.discount,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Price Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          _buildRow('Price ($itemCount item)', totalBeforeDiscount),
          _buildRow('Discount', -discount),
          _buildRow('Coupons for you', -12),
          _buildRow('Platform Fee', 3),
          _buildRow('Delivery Charges', 0, overrideText: 'FREE Delivery'),
          const Divider(),
          _buildRow('Total Amount', total, isBold: true),
        ],
      ),
    );
  }

  Widget _buildRow(String label, double amount,
      {bool isBold = false, String? overrideText}) {
    final style = TextStyle(
      fontSize: 14,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: amount < 0 ? Colors.green : Colors.black,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(overrideText ?? '₹${amount.abs().toStringAsFixed(0)}', style: style),
        ],
      ),
    );
  }
}
