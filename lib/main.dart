import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Dark Elegant',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,

        // Theme nomor 4: Dark Mode Elegant
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF800000), // maroon
          brightness: Brightness.dark,
        ),

        scaffoldBackgroundColor: const Color(0xFF121212),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Color(0xFFFFD700), // gold
          centerTitle: true,
          elevation: 0,
        ),

        cardTheme: CardThemeData(
          color: const Color(0xFF1E1E1E),
          elevation: 4,
          shadowColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const ProfilPage(),
    );
  }
}

// Halaman profil sederhana
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Foto profil lingkaran
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFFFD700),
                  width: 3,
                ),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/200/200',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Nama
            const Text(
              'Nur Affiah',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700),
              ),
            ),
            const SizedBox(height: 6),

            // Bio
            const Text(
              'C050424043 | Mahasiswa | Flutter Learner',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 24),

            // Info card 1
            _buildInfoCard(
              icon: Icons.email,
              title: 'Email',
              value: 'nuraffiah@example.com',
              iconColor: colorScheme.primary,
            ),
            const SizedBox(height: 12),

            // Info card 2
            _buildInfoCard(
              icon: Icons.phone,
              title: 'Telepon',
              value: '+62 812-3456-7890',
              iconColor: const Color(0xFFFFD700),
            ),
            const SizedBox(height: 12),

            // Info card 3
            _buildInfoCard(
              icon: Icons.location_on,
              title: 'Lokasi',
              value: 'Banjarmasin, Indonesia',
              iconColor: Colors.redAccent,
            ),
            const SizedBox(height: 12),

            // Info card 4
            _buildInfoCard(
              icon: Icons.camera_alt,
              title: 'Instagram',
              value: '@nuraffiah',
              iconColor: Colors.pinkAccent,
            ),
            const SizedBox(height: 12),

            // Info card 5
            _buildInfoCard(
              icon: Icons.school,
              title: 'Kampus',
              value: 'Politeknik Negeri Banjarmasin',
              iconColor: Colors.lightBlueAccent,
            ),
            const SizedBox(height: 24),

            // Dua tombol dengan styling berbeda
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profil'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF800000), // maroon
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.logout),
                    label: const Text('Logout'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFFFD700), // gold
                      side: const BorderSide(
                        color: Color(0xFFFFD700),
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat info card
  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color iconColor,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor,
          size: 28,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(value),
      ),
    );
  }
}