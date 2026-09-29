import 'package:cool_celebration/cool_celebration.dart';
import 'package:flutter/material.dart';

class CelebrationView extends StatelessWidget {
  const CelebrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Celebrations')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Pick an animation',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      CoolCelebration.celebrate(context, particleCount: 100);
                    },
                    icon: const Icon(Icons.celebration),
                    label: const Text('Confetti Rain'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      NovaBurst.celebrate(
                        context,
                        duration: const Duration(seconds: 3),
                        shellCount: 100,
                      );
                    },
                    icon: const Icon(Icons.auto_awesome),
                    label: const Text('Nova Burst'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
