part of 'resume_bloc.dart';

class ResumeState extends Equatable {
  const ResumeState({
    this.activeSection = 'Home',
    this.showLogo = true,
  });

  final String activeSection;
  final bool showLogo;

  ResumeState copyWith({
    String? activeSection,
    bool? showLogo,
  }) {
    return ResumeState(
      activeSection: activeSection ?? this.activeSection,
      showLogo: showLogo ?? this.showLogo,
    );
  }

  @override
  List<Object?> get props => [activeSection, showLogo];
}
