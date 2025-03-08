import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter_bloc_chat/src/core/extensions/integer_sizedbox_extension.dart';

import '../../../../core/constants/images_path.dart';
import '../../../../core/themes/app_color.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.callback,
  });

  final void Function(String) callback;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey1,
        borderRadius: BorderRadius.circular(12.0.r),
        border: Border.all(color: AppColors.grey1),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          10.wS,
          SvgPicture.asset(
            magnifyingGlassIcon,
            width: 20.w,
            height: 20.w,
            colorFilter: ColorFilter.mode(
              AppColors.grey3,
              BlendMode.srcIn,
            ),
          ),
          8.wS,
          Expanded(
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onEditingComplete: () => widget.callback(textController.text.trim()),
              style: TextStyle(
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'search'.tr(),
                hintStyle: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey3,
                ),
                contentPadding: EdgeInsets.zero,
                isDense: true,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
