import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// DATA MAKANAN
final List<Map<String, dynamic>> produk = [
  {
    'nama': 'Smartphone',
    'kategori': 'Produk elektronik',
    'harga': 2500000,
    'ikon': Icons.phone_android,
    'warna': Colors.black,
  },
  {
    'nama': 'Laptop',
    'kategori': 'Komputer portable',
    'harga': 7000000,
    'ikon': Icons.laptop,
    'warna': Colors.black,
  },
  {
    'nama': 'Smartwatch',
    'kategori': 'Jam pintar',
    'harga': 650000,
    'ikon': Icons.watch,
    'warna': Colors.black,
  },
];

// APLIKASI UTAMA
Widget MyApp() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple Flutter App',
    home: HomePage(),
  );
}

// HALAMAN HOME
Widget HomePage() {
  return Builder(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Simple Flutter App'),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              tooltip: 'About Me',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AboutPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // STACK
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const Text(
                    'My Flutter App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ROW
              const Row(
                children: [
                  Text('Garansi Toko Terbaik', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 10),
                  Icon(Icons.check_circle_outline),
                ],
              ),

              const SizedBox(height: 20),

              // GRIDVIEW
              SizedBox(
                height: 90,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: const [
                    Column(
                      children: [
                        Icon(Icons.home, size: 35),
                        Text('Home'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.shopping_cart, size: 35),
                        Text('Keranjang'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.person, size: 35),
                        Text('Profil'),
                      ],
                    ),
                  ],
                ),
              ),

              // LISTVIEW
              Expanded(
                child: ListView.builder(
                  itemCount: produk.length,
                  itemBuilder: (context, index) {
                    final item = produk[index];

                    return Card(
                      child: ListTile(
                        leading: Icon(
                          item['ikon'] as IconData,
                          color: item['warna'] as Color,
                          size: 35,
                        ),
                        title: Text(item['nama'] as String),
                        subtitle: Text(item['kategori'] as String),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),

                        // NAVIGASI DAN PENGIRIMAN DATA
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailPage(
                                  nama: item['nama'] as String,
                                  kategori: item['kategori'] as String,
                                  harga: item['harga'] as int,
                                  ikon: item['ikon'] as IconData,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// HALAMAN DETAIL MAKANAN
Widget DetailPage({
  required String nama,
  required String kategori,
  required int harga,
  required IconData ikon,
}) {
  return Builder(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Produk'),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(ikon, size: 90, color: Colors.lightBlue),

              const SizedBox(height: 20),

              Text(
                nama,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(kategori, style: const TextStyle(fontSize: 20)),

              const SizedBox(height: 20),
              Text('Harga: Rp$harga', style: const TextStyle(fontSize: 20)),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali', style: TextStyle(
                  color: Colors.lightBlue)
                  ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// HALAMAN ABOUT ME
Widget AboutPage() {
  return Builder(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('About Me'),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.lightBlue,
                child: Icon(Icons.person, size: 55, color: Colors.white),
              ),

              const SizedBox(height: 15),

              const Text(
                'ABOUT ME',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Text('Nama: Tino', style: const TextStyle(fontSize: 18)),

              const SizedBox(height: 5),

              Text('NPM: 24670132', style: const TextStyle(fontSize: 18)),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kembali', style: TextStyle(
                  color: Colors.lightBlue)
                  ),
              ),
            ],
          ),
        ),
      );
    },
  );
}