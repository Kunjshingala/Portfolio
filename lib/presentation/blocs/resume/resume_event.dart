part of 'resume_bloc.dart';

abstract class ResumeEvent extends Equatable {
  const ResumeEvent();

  @override
  List<Object?> get props => [];
}

class SectionChanged extends ResumeEvent {
  const SectionChanged(this.sectionName);
  final String sectionName;

  @override
  List<Object?> get props => [sectionName];
}

class LogoVisibilityChanged extends ResumeEvent {
  const LogoVisibilityChanged({required this.showLogo});
  final bool showLogo;

  @override
  List<Object?> get props => [showLogo];
}
