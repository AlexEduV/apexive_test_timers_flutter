import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSheetObserver extends BlocObserver {

  const TimeSheetObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    debugPrint('${bloc.runtimeType} $change');
  }

}