import 'package:flutter/material.dart';
import 'package:untitled/core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const Center(
          child: Text(
            'Read To Learn',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
