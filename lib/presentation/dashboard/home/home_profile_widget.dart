import 'package:flutter/material.dart';

class HomeProfileWidget extends StatelessWidget {
  const HomeProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hai, Altop',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Selamat Datang'),
            ],
          ),
          Image.asset(
            "assets/images/edo selfie.png",
            width: 50,
          ),
        ],
      ),
    );
  }
}
