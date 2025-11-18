import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../widgets/custom_card.dart';
// --- Anda bisa menjalankan kode ini di DartPad atau proyek Flutter Anda ---

class SuperAdminDashboard extends StatefulWidget {
  const SuperAdminDashboard({super.key});

  @override
  State<SuperAdminDashboard> createState() => _SuperAdminDashboardState();
}

class _SuperAdminDashboardState extends State<SuperAdminDashboard> {
  bool isLoading = true;
  Map<String, dynamic>? SuperAdminDashboardData;
  String? errorMessage;

  @override  
  void initState() {
    super.initState();
    fetchSuperAdminDashboardData();
  }

  Future<void> fetchSuperAdminDashboardData() async {
    final result = await ApiService.getSuperAdminDashboard();

    if (result['success']) {
      setState(() {
        SuperAdminDashboardData = result['data'];
        isLoading = false;
      });
    } else {
      setState(() {
        errorMessage = result['message'];
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // Warna latar belakang yang lembut, mendekati gambar
    const Color softBackgroundColor = Color(0xFFFAF6E6);

    return Scaffold(
      backgroundColor: softBackgroundColor,
      
      // Bagian Body (Konten Utama)
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo atau Judul Aplikasi
              Center(
                child: Column(
                  children: [
                    // Placeholder untuk Logo (Ganti dengan Image.asset atau Image.network jika ada)
                    const Icon(
                      Icons.home_work, 
                      size: 60, 
                      color: Color(0xFF4CAF50) // Hijau seperti logo
                    ), 
                    const SizedBox(height: 5),
                    Text(
                      'Manajemen RT/RW',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                    const Text(
                      'Membangun Komunitas Cerdas',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),

              // Judul Dashboard
              const Text(
                'Dashboard Super Admin',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Data Terbatas',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFD36F00), // Warna oranye
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              const SizedBox(height: 20),

              // Kartu Data Statistik
              _buildDataCard(
                title: 'Jumlah Warga',
                value: '125.000',
              ),
              const SizedBox(height: 15),
              _buildDataCard(
                title: 'Jumlah Kartu Keluarga',
                value: '95.000',
              ),
              const SizedBox(height: 15),
              _buildDataCard(
                title: 'Jumlah RT',
                value: '15',
              ),
              
              
              // Spasi tambahan di bagian bawah
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        // Set type fixed agar item tetap terlihat saat item banyak
        type: BottomNavigationBarType.fixed, 
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green.shade700, // Warna aktif
        unselectedItemColor: Colors.grey.shade600, // Warna non-aktif
        currentIndex: 0, // Indeks item yang aktif (misalnya Home)
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '', // Label dikosongkan untuk tampilan ikon saja
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        onTap: (index) {
          // Handle ketika item BottomNav diklik
        },
      ),
    );
  }

  // Widget pembantu untuk membuat kotak data (Card)
  Widget _buildDataCard({required String title, required String value}) {
    return Card(
      elevation: 2.0, // Sedikit bayangan
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: double.infinity, // Mengambil lebar penuh
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Contoh Penggunaan (Opsional, hanya untuk menjalankan di lingkungan penuh) ---
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Admin Dashboard Demo',
//       debugShowCheckedModeBanner: false,
//       home: SuperAdminDashboard(),
//     );
//   }
// }