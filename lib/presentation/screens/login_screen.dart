import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/api_service.dart';
import '../../routes/app_routes.dart';  // Ganti dengan path rute Anda

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();  // Ganti dari nameController ke usernameController
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
<<<<<<< HEAD
    // Hardcoded username dan password
    const correctUsername = 'user';
    const correctPassword = '123';

    if (_nameController.text == correctUsername &&
        _passwordController.text == correctPassword) {
      // Login berhasil, navigasi ke MainScreen (pakai bottom nav)
      Navigator.pushReplacementNamed(context, AppRoutes.main);
    } else {
      // Login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama atau password salah')),
=======
    setState(() {
      _isLoading = true;  // Menandakan bahwa proses login sedang berlangsung
    });

    try {
      final response = await ApiService.login(
        _usernameController.text,  // Gunakan usernameController untuk username
        _passwordController.text,
>>>>>>> e14ce3aabe8ccee4a796d6bb13929cc3a864d664
      );

      if (response['message'] == 'Login berhasil!') {
        // Simpan token ke SharedPreferences setelah login berhasil
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', response['token']);

        // Navigasi ke MainScreen (pakai bottom nav)
        Navigator.pushReplacementNamed(context, AppRoutes.main);
      } else {
        // Menampilkan pesan kesalahan jika login gagal
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username atau password salah')),
        );
      }
    } catch (e) {
      // Menampilkan pesan kesalahan jika terjadi error dalam login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal login: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;  // Menandakan bahwa proses login telah selesai
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                // Field Username (Nama Pengguna diganti menjadi Username)
                TextField(
                  controller: _usernameController,  // Gunakan _usernameController
                  decoration: const InputDecoration(
                    labelText: 'Username',  // Menggunakan Username
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Field Kata Sandi
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Kata sandi',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lupa kata sandi?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Tombol Masuk
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,  // Disable tombol saat loading
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Masuk',
                            style: TextStyle(fontSize: 16),
                          ),
                  ),
                ),
                const SizedBox(height: 16),

                // Tautan Daftar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Belum mendaftar? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.register);
                      },
                      child: const Text(
                        'Daftar sekarang',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
