import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventDetailPage extends StatefulWidget {
  final String eventId;
  const EventDetailPage({super.key, required this.eventId});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  Map<String, dynamic>? event;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEventDetail();
  }

  Future<void> fetchEventDetail() async {
    final response = await http.get(
      Uri.parse("https://api.example.com/events/${widget.eventId}"),
    );

    if (response.statusCode == 200) {
      setState(() {
        event = jsonDecode(response.body);
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    if (event == null) return const Center(child: Text("Event tidak ditemukan"));

    return Scaffold(
      appBar: AppBar(title: Text(event!['title'] ?? "Event Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tanggal: ${event!['date']}"),
            const SizedBox(height: 10),
            Text("Deskripsi:"),
            Text(event!['description'] ?? "-"),
          ],
        ),
      ),
    );
  }
}
