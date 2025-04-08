import 'package:flutter/material.dart';
class PaketScreen extends StatefulWidget {
  const PaketScreen({super.key});

  @override
  State<PaketScreen> createState() => _PaketScreenState();
}

class _PaketScreenState extends State<PaketScreen> {
  int _selectedIndex = -1;

  final List<Map<String, dynamic>> _paketList = [
    {
      'title': 'Paket Murah',
      'speed': '30 Mbps',
      'price': 115000.00,
      'icon': Icons.wifi,
    },
    {
      'title': 'Paket Menengah',
      'speed': '50 Mbps',
      'price': 150000.00,
      'icon': Icons.wifi,
    },
    {
      'title': 'Paket Mewah',
      'speed': '100 Mbps',
      'price': 200000.00,
      'icon': Icons.wifi,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Paket', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: _paketList.length,
                separatorBuilder: (_, __) => const Divider(height: 32),
                itemBuilder: (context, index) {
                  final paket = _paketList[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(paket['icon'], size: 32, color: Colors.black),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                paket['title'],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                paket['speed'],
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Perbulan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          paket['price'].toStringAsFixed(2).replaceAll('.', ','),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _selectedIndex >= 0
                    ? () {
                        final selected = _paketList[_selectedIndex];
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Paket dipilih: ${selected['title']}')),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Pilih'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
