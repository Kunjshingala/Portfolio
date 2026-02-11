part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  final String activeSection;

  const PortfolioState({this.activeSection = 'Home'});

  PortfolioState copyWith({String? activeSection}) {
    return PortfolioState(activeSection: activeSection ?? this.activeSection);
  }

  @override
  List<Object?> get props => [activeSection];
}
