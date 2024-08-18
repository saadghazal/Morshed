import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerState.initial());

  void openDrawer({required BuildContext context, required DrawerType drawerType}) {
    emit(
      state.copyWith(
        drawerType: drawerType,
      ),
    );
    Scaffold.of(context).openDrawer();
  }

  void togglePopOut({required BuildContext context}) {
    if (!state.isPopOut) {
      Navigator.of(context);
    }
    emit(state.copyWith(isPopOut: !state.isPopOut));
  }

  void closeDrawer({required BuildContext context}) {
    Scaffold.of(context).closeDrawer();
  }
}
