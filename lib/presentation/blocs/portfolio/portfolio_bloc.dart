import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(const PortfolioState()) {
    on<SectionChanged>((event, emit) {
      emit(state.copyWith(activeSection: event.sectionName));
    });
  }
}
