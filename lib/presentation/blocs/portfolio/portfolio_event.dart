part of 'portfolio_bloc.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object?> get props => [];
}

class SectionChanged extends PortfolioEvent {
  final String sectionName;
  const SectionChanged(this.sectionName);

  @override
  List<Object?> get props => [sectionName];
}
