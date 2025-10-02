// lib/main.dart

import 'package:flutter/material.dart';
import 'package:latkuiz/pages/login_page.dart'; // Ganti your_project_name

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Kendaraan',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), // Memulai aplikasi dari halaman login
    );
  }
}