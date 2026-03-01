import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'resume_event.dart';
part 'resume_state.dart';

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  ResumeBloc() : super(const ResumeState()) {
    on<SectionChanged>((event, emit) {
      emit(state.copyWith(activeSection: event.sectionName));
    });

    on<LogoVisibilityChanged>((event, emit) {
      emit(state.copyWith(showLogo: event.showLogo));
    });
  }
}
