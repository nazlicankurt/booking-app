import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoadingSkeleton extends StatelessWidget {
  final int itemCount;
  final EdgeInsetsGeometry padding;

  const CustomLoadingSkeleton({
    super.key,
    this.itemCount = 6,
    this.padding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: padding,
          child: Skeletonizer(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
