import 'package:flutter/material.dart';
import 'login_page.dart';

class FurnitureApp extends StatelessWidget {
  const FurnitureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const FurnitureExam(),
    );
  }
}

class FurnitureExam extends StatelessWidget {
  const FurnitureExam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/room1.jpeg',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 36, 28, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'MAKE YOUR\nHOME BEAUTIFUL',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                          letterSpacing: -0.5,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'The best simple place where you\ndiscover most wonderful furnitures and\nmake your home beautiful',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.6,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A1A1A),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 120,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}