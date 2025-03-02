import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/blocs/theme/theme_bloc.dart';
import '../core/themes/app_color.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key,
    this.color = AppColors.green1,
    this.isMini = true,
  });

  final Color color;
  final bool isMini;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: isMini ? 16.w : null,
        height: isMini ? 16.w : null,
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}

class AppLoadingWithBackgroundWidget extends StatelessWidget {
  const AppLoadingWithBackgroundWidget({
    super.key,
    this.color = AppColors.green1,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.read<ThemeBloc>().state.isDarkMode
          ? Colors.black
          : Colors.white,
      child: Center(
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}
