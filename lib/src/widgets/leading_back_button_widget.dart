import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../core/blocs/theme/theme_bloc.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.color,
    this.callback,
  });

  final Color? color;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => callback ?? context.pop(),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      visualDensity: VisualDensity.compact,
      color: color ??
          (context.read<ThemeBloc>().state.isDarkMode
              ? Colors.white
              : Colors.black),
      splashRadius: 20.r,
    );
  }
}
