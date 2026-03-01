import 'package:flutter_bloc/flutter_bloc.dart';

class HoverCubit extends Cubit<bool> {
  HoverCubit() : super(false);

  void setHovered(bool isHovered) => emit(isHovered);
}
