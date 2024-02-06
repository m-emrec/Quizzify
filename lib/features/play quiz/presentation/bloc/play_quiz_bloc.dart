import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'play_quiz_event.dart';
part 'play_quiz_state.dart';

class PlayQuizBloc extends Bloc<PlayQuizEvent, PlayQuizState> {
  PlayQuizBloc() : super(PlayQuizInitial()) {
    on<PlayQuizEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
