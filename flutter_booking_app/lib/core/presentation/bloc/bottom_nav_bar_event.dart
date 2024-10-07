import 'package:equatable/equatable.dart';

abstract class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();

  @override
  List<Object?> get props => [];
}

class SelectTab extends BottomNavBarEvent {
  final int index;

  const SelectTab(this.index);

  @override
  List<Object?> get props => [index];
}
