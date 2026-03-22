import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDE8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Good Morning 👋',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D2B1F),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Welcome to your dashboard',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFB0A097),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8D5CB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Home Page Content\nYahan aap apna content add karein',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3D2B1F),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}