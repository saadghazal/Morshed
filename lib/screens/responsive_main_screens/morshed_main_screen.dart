import 'package:abwaab_practice/blox/drawer_cubit/drawer_cubit.dart';
import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:abwaab_practice/screens/responsive_main_screens/morshed_pc_screen_size.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponsiveScreen extends StatefulWidget {
  const ResponsiveScreen({super.key});

  @override
  State<ResponsiveScreen> createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(),
      lazy: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 935) {
            if (constraints.maxWidth >= 1230) {
              context.read<ResponsivenessCubit>().setDeviceType(ScreenType.desktop);
              return MorshedMainScreen();
            }
            if (constraints.maxWidth >= 1130) {
              context.read<ResponsivenessCubit>().setDeviceType(ScreenType.largeTablet);
              return MorshedMainScreen();
            }

            context.read<ResponsivenessCubit>().setDeviceType(ScreenType.smallTablet);
            return MorshedMainScreen();
          } else {
            if (constraints.maxWidth >= 500) {
              context.read<ResponsivenessCubit>().setDeviceType(ScreenType.miniTablet);
              return MorshedMainScreen();
            }
            print("Mobile");
            context.read<ResponsivenessCubit>().setDeviceType(ScreenType.mobile);
            return MorshedMainScreen();
          }
        },
      ),
    );
  }
}
