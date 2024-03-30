import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/application/bloc/application_events.dart';
import 'package:ulearning/pages/application/bloc/application_states.dart';

class ApplicationBlocs extends Bloc<ApplicationEvents, ApplicationStates> {
  ApplicationBlocs() : super(ApplicationStates()) {
    on<TriggerAppEvent>((event, emit) {
      emit(ApplicationStates(index: event.index));
    });
  }
}
