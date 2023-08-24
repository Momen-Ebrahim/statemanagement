import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changecolor_state.dart';

class ChangecolorCubit extends Cubit<ChangecolorState> {
  ChangecolorCubit() : super(ChangecolorInitial());
  int index = 0;
  void changevolor(int inde) {
    index = inde;
    emit(ChangecolorInitial());
  }

 
}
