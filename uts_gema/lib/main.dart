import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gema UTS cuy',
      theme: ThemeData(
      primarySwatch: Colors.cyan,
      ),
      home: Producthome(),
    );
  }
}

class Barang {
  final String nama;
  final String gambar;
  final String keterangan;
  final String harga;

  Barang(this.nama, this.gambar, this.keterangan, this.harga);
}

final List<Barang> model = [
  Barang(
      'Nike Air force 1',
      'assets/images/nikeaf1.png',
      'Best Seller',
      '1.700.000 IDR'),
  Barang(
      'Nike jordan',
      'assets/images/jordan.png',
      'Fast, Nimble, Become the Wind!',
      '4.999.999 IDR'),
  Barang(
      'Converse 70s',
      'assets/images/cons.png',
      'Casual era',
      '799.999 IDR'),
  Barang(
      'Converse Basketball',
      'assets/images/conshi.png',
      'Basketball is my life',
      '899.999 IDR'),
  Barang(
      'Vans Old School full black',
      'assets/images/vans.png',
      'Casual era',
      '1.699.999 IDR'),
];

class Producthome extends StatelessWidget {
  Producthome({Key? key});

  final List<Color> colors = [
    Colors.red[100]!,
    Colors.green[100]!,
    Colors.blue[100]!,
    Colors.yellow[100]!,
    Colors.purple[100]!,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Text('Shoes',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
                        Spacer(
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/nikelogo.png'),
                  radius: 50.0,
                ),
                
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: model.length,
              itemBuilder: (BuildContext context, int index) {
                final product = model[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10)
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.nama,
                                style: const TextStyle(fontSize: 80.0)),
                            const SizedBox(height: 8.0),
                            Text(product.keterangan, style: const TextStyle(fontSize: 30)),
                            const SizedBox(height: 8.0),
                            Text(product.harga, style: const TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Image.network(product.gambar,
                          width: 200.0, height: 200.0),
                    ],
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