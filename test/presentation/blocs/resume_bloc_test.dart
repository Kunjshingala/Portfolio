import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kunj_shingala/presentation/blocs/resume/resume_bloc.dart';

void main() {
  group('ResumeBloc', () {
    late ResumeBloc resumeBloc;

    setUp(() {
      resumeBloc = ResumeBloc();
    });

    tearDown(() {
      resumeBloc.close();
    });

    test('initial state is ResumeState(activeSection: "Home")', () {
      expect(resumeBloc.state, const ResumeState(activeSection: 'Home'));
    });

    blocTest<ResumeBloc, ResumeState>(
      'emits [ResumeState(activeSection: "About")] when SectionChanged("About") is added',
      build: () => resumeBloc,
      act: (bloc) => bloc.add(const SectionChanged('About')),
      expect: () => [
        const ResumeState(activeSection: 'About'),
      ],
    );

    blocTest<ResumeBloc, ResumeState>(
      'emits [ResumeState(activeSection: "Projects")] when SectionChanged("Projects") is added',
      build: () => resumeBloc,
      act: (bloc) => bloc.add(const SectionChanged('Projects')),
      expect: () => [
        const ResumeState(activeSection: 'Projects'),
      ],
    );
  });
}
