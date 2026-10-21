import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTaskScreen extends StatefulWidget {
  const ProfileTaskScreen({super.key});

  @override
  State<ProfileTaskScreen> createState() => _ProfileTaskScreenState();
}

class _ProfileTaskScreenState extends State<ProfileTaskScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildTentangSayaTab(),
      _buildProjectTab(),
      _buildSkillTab(),
      _buildKontakTab(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFC6E7FF),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black87),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),

      body: pages[_currentIndex],

      // ------NAVBAR------
      bottomNavigationBar: Container(
        color: const Color(0xFF9DC1EA),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,

          selectedItemColor: const Color(0xFF1E3A8A),
          unselectedItemColor: const Color(0xFF64748B),
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Tentang Saya',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_outlined),
              activeIcon: Icon(Icons.folder),
              label: 'Project',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              activeIcon: Icon(Icons.book),
              label: 'Skill',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone_outlined),
              activeIcon: Icon(Icons.phone),
              label: 'Kontak',
            ),
          ],
        ),
      ),
    );
  }

  // -----TENTANG SAYA-----

  Widget _buildTentangSayaTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Center(
            child: Text(
              'Portofolio',
              style: GoogleFonts.lalezar(
                fontSize: 50,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF1E3A8A),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: 120,
                      height: 150,
                      child: Image.asset(
                        'assets/images/myft.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.blueAccent,
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fitrotul Anisa',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E3A8A),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Purwosari',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF1E3A8A),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Rekayasa Perangkat Lunak',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF1E3A8A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            icon: const Icon(Icons.person_outline, color: Colors.blueAccent),
            label: const Text(
              'Tentang Saya',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 59, 89, 199),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Hallo! Saya Fitrotul Anisa, siswi kelas XI '
              'jurusan Rekayasa Perangkat Lunak. Saya memiliki '
              'ketertarikan pada dunia pemrograman dan desain, '
              'terutama dalam membuat tampilan website dan '
              'aplikasi yang menarik serta mudah digunakan. '
              'Saya senang mempelajari hal-hal baru dan terus '
              'mengembangkan kemampuan saya di bidang teknologi.',
              style: TextStyle(
                fontSize: 20,
                height: 1.5,
                color: Color(0xFF1E3A8A),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -----------PROJECT-----------

  Widget _buildProjectTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'Project',
          style: GoogleFonts.lalezar(
            fontSize: 50,
            fontWeight: FontWeight.normal,
            color: Color(0xFF1E3A8A),
          ),

          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 4),

        const Text(
          'Beberapa Project yang Pernah Saya Buat\n'
          'Selama Belajar dan Mengembangkan Skill ',
          style: TextStyle(fontSize: 20, color: Color(0xFF1E3A8A)),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 20),

        _projectCard(
          'assets/images/projek1.png',
          'Web Landing Page Jus Segar',
          'Landing page promosi jus\n'
              'buah segar sederhana.',
        ),

        _projectCard(
          'assets/images/projek2.jpeg',
          'Mobile E-commerce Sederhana',
          'Aplikasi belanja kebutuhan olahraga sederhana.',
        ),

        _projectCard(
          'assets/images/projek3.png',
          'Web Responsive',
          'Membuat halaman login menggunakan HTML, CSS\n'
              'dan JavaScript.',
        ),
      ],
    );
  }

  Widget _projectCard(String imagePath, String title, String desc) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 162,
                height: 122,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -----SKILL-----

  Widget _buildSkillTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'Skill',
          style: GoogleFonts.lalezar(
            fontSize: 50,
            fontWeight: FontWeight.normal,
            color: Color(0xFF1E3A8A),
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 4),

        const Text(
          'Berikut adalah skill yang saya miliki\n'
          'dan sedang saya kembangkan',
          style: TextStyle(fontSize: 20, color: Color(0xFF1E3A8A)),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 25),

        _skillCategorySection(
          icon: Icons.code,
          categoryTitle: 'Frontend & Web',
          skills: [
            _skillBox('HTML', 'assets/images/html3.png'),
            _skillBox('CSS', 'assets/images/css.png'),
            _skillBox('JavaScript', 'assets/images/js.jpg'),
            _skillBox('Tailwind CSS', 'assets/images/tailwind.png'),
          ],
        ),

        const SizedBox(height: 16),

        _skillCategorySection(
          icon: Icons.settings,
          categoryTitle: 'Backend & Tools',
          skills: [
            _skillBox('Node.js', 'assets/images/nodejs.png'),
            _skillBox('VS Code', 'assets/images/vscode.png'),
          ],
        ),

        const SizedBox(height: 16),

        _skillCategorySection(
          icon: Icons.phone_android,
          categoryTitle: 'Design & Other',
          skills: [
            _skillBox('Figma', 'assets/images/figma.png'),
            _skillBox('Dart', 'assets/images/dart.png'),
          ],
        ),
      ],
    );
  }

  Widget _skillCategorySection({
    required IconData icon,
    required String categoryTitle,
    required List<Widget> skills,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // Background putih besar
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: const Color(0xFF1E3A8A)),
              const SizedBox(width: 8),
              Text(
                categoryTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF1E3A8A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.3,
            children: skills,
          ),
        ],
      ),
    );
  }

  Widget _skillBox(String title, String assetPath) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(
          255,
          227,
          242,
          252,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset(
              assetPath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.code, size: 20, color: Colors.blue),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: Color(0xFF1E3A8A),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // -----KONTAK-----

  Widget _buildKontakTab() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Kontak',
            style: GoogleFonts.lalezar(
              fontSize: 50,
              fontWeight: FontWeight.normal,
              color: Color(0xFF1E3A8A),
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Hubungi Saya Melalui Media Berikut Jika Ingin '
            'Bertanya atau Hanya Sekadar Menyapa',
            style: TextStyle(fontSize: 20, color: Color(0xFF1E3A8A)),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          _contactCard(Icons.email, 'Email', 'anisafisa791@gmail.com'),
          _contactCard(Icons.camera_alt, 'Instagram', '@pisss_rjan'),
          _contactCard(Icons.phone, 'WhatsApp', '087-7562-0938'),
          _contactCard(
            Icons.location_on,
            'Lokasi',
            'Sentul, Purwodadi, Pasuruan, Jawa Timur',
          ),

          const SizedBox(height: 40),

          
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'assets/images/laptop.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactCard(IconData icon, String title, String subtitle) {
  return Card(
    elevation: 0,
    margin: const EdgeInsets.only(bottom: 15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
         
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xFFCBE3FF), 
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF1E3A8A),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF1E3A8A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF1E3A8A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}