import 'package:flutter/material.dart';
import '../../../models/paket.dart';
import '../../../services/api_service.dart';

class PaketScreen extends StatefulWidget {
  const PaketScreen({Key? key}) : super(key: key);

  @override
  State<PaketScreen> createState() => _PaketScreenState();
}

class _PaketScreenState extends State<PaketScreen> {
  late Future<List<Paket>> futurePaketList;

  @override
  void initState() {
    super.initState();
    futurePaketList = ApiService.fetchPaketList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Paket'),
      ),
      body: FutureBuilder<List<Paket>>(
        future: futurePaketList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data paket.'));
          } else {
            final paketList = snapshot.data!;
            return ListView.builder(
              itemCount: paketList.length,
              itemBuilder: (context, index) {
                final paket = paketList[index];
                return Card(
                  child: ListTile(
                    title: Text(paket.nama),
                    subtitle: Text('Kecepatan: ${paket.kecepatan}'),
                    trailing: Text('Rp ${paket.harga.toStringAsFixed(0)}'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
