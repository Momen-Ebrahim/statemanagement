import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'raido_state.dart';

class RaidoCubit extends Cubit<RaidoState> {
  RaidoCubit() : super(RaidoInitial());
  int real = 0;
  void changeval() {
    emit(RaidoInitial());
  }
}
