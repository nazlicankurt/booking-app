import 'package:equatable/equatable.dart';

class BottomNavBarState extends Equatable {
  final int selectedIndex;

  const BottomNavBarState({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
