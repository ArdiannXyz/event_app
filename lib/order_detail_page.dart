import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final String orderId;
  const OrderDetailPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    // Sebenarnya order detail bisa fetch API /orders/{orderId}
    // Tapi minimal untuk demo cukup tampilkan order_id dari payload FCM
    return Scaffold(
      appBar: AppBar(title: const Text("Order Detail")),
      body: Center(
        child: Text("Detail Pesanan dengan ID: $orderId",
            style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
