part of 'bottom_navigation_bar_bloc.dart';

sealed class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();
  
  @override
  List<Object> get props => [];
}

final class BottomNavigationBarInitial extends BottomNavigationBarState {}
