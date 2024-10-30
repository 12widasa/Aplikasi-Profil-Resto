import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'style.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resto Profile',
      theme: ThemeData(
        primarySwatch: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final double latitude = -6.981678527582452;
  final double longitude = 110.40884644592103;

  Future<void> _launchURL(String scheme, String path, [String? query]) async {
    final Uri uri =
        Uri(scheme: scheme, path: path, queryParameters: {'q': query});
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  void _launchEmail() async {
    final String email =
        'mailto:example@resto.com?subject=${Uri.encodeComponent('Tanya Seputar Resto')}';
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Could not launch $email';
    }
  }

  void _launchPhone() => _launchURL('tel', '0243517261');
  void _launchMap() => _launchURL('geo', '$latitude,$longitude',
      'Universitas Dian Nuswantoro, Jl. Imam Bonjol No.207, Pendrikan Kidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50131');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: const Text('Rm. Sedap Rasa', style: titleStyle1),
          centerTitle: true,
          elevation: 10,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: appBarGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: imageBoxDecoration('assets/Rm.SedapRasa.jpeg'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(
                  icon: Icons.email,
                  onPressed: _launchEmail,
                ),
                _buildIconButton(
                  icon: Icons.map,
                  onPressed: _launchMap,
                ),
                _buildIconButton(
                  icon: Icons.phone,
                  onPressed: _launchPhone,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Deskripsi:', style: titleStyle),
            const Text(
              'Restoran ini menyajikan berbagai macam menu makanan lezat dan spesial.',
              style: descriptionStyle,
            ),
            const SizedBox(height: 16),
            const Text('List Menu:', style: titleStyle),
            const Text('1. Nasi Goreng', style: descriptionStyle),
            const Text('2. Ayam Bakar', style: descriptionStyle),
            const Text('3. Ikan Bakar', style: descriptionStyle),
            const SizedBox(height: 16),
            const Text('Alamat:', style: titleStyle),
            const Text('Jl. Sultan Agung No.1, Semarang',
                style: descriptionStyle),
            const SizedBox(height: 16),
            const Text('Jam Buka:', style: titleStyle),
            const BulletListItem(text: 'Senin - Jumat: 08:00 - 22:00'),
            const BulletListItem(text: 'Sabtu - Minggu: 10:00 - 23:00'),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return Container(
      decoration: iconButtonDecoration,
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
        iconSize: 30,
      ),
    );
  }
}

class BulletListItem extends StatelessWidget {
  final String text;
  const BulletListItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle,
            size: 8, color: Colors.black54), // Bullet point
        const SizedBox(width: 8), // Spacing
        Text(text, style: bulletItemStyle),
      ],
    );
  }
}
