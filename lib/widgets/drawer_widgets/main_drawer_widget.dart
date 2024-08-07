import 'package:abwaab_practice/blox/drawer_cubit/drawer_cubit.dart';
import 'package:abwaab_practice/widgets/drawer_widgets/daily_activity_drawer.dart';
import 'package:abwaab_practice/widgets/drawer_widgets/material_performance_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width / 1.5,
            height: double.maxFinite,
            child: SingleChildScrollView(
              child: state.drawerType == DrawerType.daily
                  ? DailyActivityDrawer()
                  : MaterialPerformanceDrawer(),
            ),
          ),
        );
      },
    );
  }
}
