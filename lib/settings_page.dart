import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fcm_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? _token;
  bool _receiveNotif = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
    _getToken();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _receiveNotif = prefs.getBool("receive_notif") ?? true;
    });
  }

  Future<void> _getToken() async {
    final token = await FCMService().getToken();
    setState(() {
      _token = token;
    });
  }

  Future<void> _toggleNotif(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("receive_notif", value);
    setState(() {
      _receiveNotif = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("FCM Token:", style: TextStyle(fontWeight: FontWeight.bold)),
            SelectableText(_token ?? "Mengambil token..."),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text("Terima Notifikasi"),
              value: _receiveNotif,
              onChanged: _toggleNotif,
            ),
          ],
        ),
      ),
    );
  }
}
