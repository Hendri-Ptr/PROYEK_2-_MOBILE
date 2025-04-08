import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan',style: TextStyle(fontWeight: FontWeight.bold ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Avatar dan nama pengguna
          Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      backgroundColor: Color(0xFFE5F1FB),
                      child: Icon(Icons.person, size: 48, color: Colors.blue),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(Icons.edit, size: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Hendri Paturaya',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '@hendri10',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Divider(),

          // List menu
          _buildMenuItem(context, 'Paket Aktif', Icons.wifi),
          _buildMenuItem(context, 'Langganan', Icons.subscriptions),
          _buildMenuItem(context, 'Tagihan', Icons.receipt),
          _buildMenuItem(context, 'Riwayat Tagihan', Icons.history),
          const Divider(),
          _buildMenuItem(context, 'Keluar', Icons.logout, isLogout: true),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        if (isLogout) {
          // Logout: hapus data login dan arahkan ke login screen
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.login, (route) => false);
        } else {
          // Placeholder untuk navigasi menu lainnya
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title diklik')),
          );
        }
      },
    );
  }
}
