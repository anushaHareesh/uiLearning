import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_events.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';

class HomepageBloc extends Bloc<HomePageEvents, HomePageStates> {
  HomepageBloc() : super(HomePageStates()) {
    on<HomePageDots>((event, emit) {
      emit(state.copywith(event.index));
    });
  }
}
