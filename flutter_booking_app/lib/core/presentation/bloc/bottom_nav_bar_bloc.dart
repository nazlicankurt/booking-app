import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_nav_bar_event.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(const BottomNavBarState(selectedIndex: 0)) {
    on<SelectTab>((event, emit) {
      emit(BottomNavBarState(selectedIndex: event.index));
    });
  }
}
