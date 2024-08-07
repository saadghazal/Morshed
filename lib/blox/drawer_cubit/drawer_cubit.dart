import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  void closeDrawer({required BuildContext context}) {
    Scaffold.of(context).closeDrawer();
  }
}
