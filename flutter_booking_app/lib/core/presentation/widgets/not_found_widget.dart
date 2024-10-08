import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomEmptyState extends StatelessWidget {
  final String message;
  final String lottieAssetPath;

  const CustomEmptyState({
    super.key,
    required this.message,
    required this.lottieAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            lottieAssetPath,
            width: 200,
            height: 200,
            repeat: false,
          ),
          const SizedBox(height: 20),
          Text(
            message,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
