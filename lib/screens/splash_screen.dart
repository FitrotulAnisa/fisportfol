import 'dart:async';
import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;
  Timer? _splashTimer;

  final List<Map<String, String>> _splashData = [
    {
      "image": "assets/images/hp.png",
      "title": "FISPORTFOL",
      "subtitle": "Mari jelajahi tentang saya",
    },
    {
      "image": "assets/images/laptop2.png",
      "title": "",
      "subtitle":
          "Halo, saya Fitrotul Anisa seorang siswi SMKN 1 Purwosari yang baru saja memulai pengalaman baru dalam dunia software development"
    },
    {
      "image": "assets/images/pintu.png",
      "title": "Siap Menjelajah?",
      "subtitle":
          "Silahkan jelajahi halaman portofolio ini untuk melihat perjalanan belajar dan karya yang telah saya buat.",
    },
  ];

  @override
  void initState() {
    super.initState();

   
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _startSplashTimer();
      }
    });
  }

  void _startSplashTimer() {
    _splashTimer?.cancel();

    
    if (_currentIndex == 2) return;

    _splashTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted || !_pageController.hasClients) return;

      final nextIndex = _currentIndex + 1;

      if (nextIndex < _splashData.length) {
        _pageController.animateToPage(
          nextIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _nextPage() {
    if (_currentIndex < 2) {
      _splashTimer?.cancel();

      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _splashTimer?.cancel();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
      );
    }
  }

  @override
  void dispose() {
    _splashTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9DC1EA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _splashData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });

                  _startSplashTimer();
                },
                itemBuilder: (context, index) {
                  final data = _splashData[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 500,
                            width: 400,
                            child: Image.asset(
                              data["image"]!,
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.image,
                                size: 80,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),

                        if (data["title"]!.isNotEmpty) ...[
                          Transform.translate(
                            offset: const Offset(0, -70),
                            child: Text(
                              data["title"]!,
                              style: GoogleFonts.lalezar(
                                fontSize: 50,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(221, 0, 6, 54),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],

                        Transform.translate(
                          offset: const Offset(0, -80),
                          child: Text(
                            data["subtitle"]!,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(221, 0, 6, 54),
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0066FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: _nextPage,
                  child: Text(
                    _currentIndex == 2 ? "Mulai" : "Selanjutnya",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
