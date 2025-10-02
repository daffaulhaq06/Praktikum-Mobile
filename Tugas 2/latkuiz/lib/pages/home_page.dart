// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:latkuiz/data/vehicle_data.dart'; 
import 'package:latkuiz/pages/detail_page.dart'; 
import 'package:latkuiz/pages/login_page.dart'; 

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});
  
  void _logout(BuildContext context) {
    // Kembali ke halaman login dan hapus semua halaman sebelumnya dari stack
     Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Kendaraan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selamat Datang, $username!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vehicleList.length,
              itemBuilder: (context, index) {
                final Vehicle vehicle = vehicleList[index];
                return InkWell(
                  onTap: () {
                    // Navigasi ke DetailPage dengan membawa data vehicle
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailPage(vehicle: vehicle);
                    }));
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      children: [
                        Image.asset(
                          vehicle.imageAsset,
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                          // Menambahkan error builder jika gambar tidak ditemukan
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              width: 120,
                              height: 100,
                              child: Icon(Icons.broken_image, size: 40),
                            );
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vehicle.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(vehicle.type),
                                const SizedBox(height: 8),
                                Text(
                                  vehicle.price,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}