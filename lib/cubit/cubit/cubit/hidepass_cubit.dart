import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hidepass_state.dart';

class HidepassCubit extends Cubit<HidepassState> {
  HidepassCubit() : super(HidepassInitial());
  bool ans = false;
  void hide() {
    if (ans == true) {
      ans = false;
    } else {
      ans = true;
    }
    emit(HidepassInitial());
  }
}
