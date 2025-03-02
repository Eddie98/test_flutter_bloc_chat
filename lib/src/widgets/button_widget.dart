import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/themes/app_color.dart';
import 'loading_widget.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.label,
    this.callback,
    this.isLoading = false,
    this.marginHorizontal = 0.0,
    this.color = AppColors.green1,
    this.height = 48.0,
    this.isHollow = false,
  });

  final String label;
  final bool isLoading;
  final VoidCallback? callback;
  final double marginHorizontal;
  final Color color;
  final double height;
  final bool isHollow;

  @override
  Widget build(BuildContext context) {
    final isDisabled = callback == null;

    return InkWell(
      onTap: callback,
      borderRadius: BorderRadius.circular(8.8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: marginHorizontal.w),
        child: Container(
          height: height.h,
          decoration: BoxDecoration(
            color: isDisabled
                ? AppColors.green1
                : isHollow
                    ? Colors.transparent
                    : color,
            borderRadius: BorderRadius.circular(8.8.r),
            border: Border.all(
                color: isDisabled ? AppColors.green1 : color, width: 1.5,),
          ),
          child: Center(
            child: isLoading
                ? AppLoadingWidget(color: Colors.white)
                : Text(
                    label,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isDisabled ? Colors.black : Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
