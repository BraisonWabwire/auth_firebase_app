import 'package:auth_firebase_app/app/auth_service.dart';
import 'package:flutter/material.dart';

class AppNavigationLayout extends StatelessWidget {
  const AppNavigationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final user = authService.value.currentUser; // Access currentUser from AuthService
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              try {
                await authService.value.signOut();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sign-out failed: $e')),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome${user?.email != null ? ', ${user!.email}' : ''}!',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text('You are signed in.'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Add navigation logic here (e.g., switch to Profile page)
        },
      ),
    );
  }
}