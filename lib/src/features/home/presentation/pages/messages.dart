import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter_bloc_chat/src/core/extensions/integer_sizedbox_extension.dart';
import 'package:test_flutter_bloc_chat/src/core/utils/logger.dart';

import '../../../../core/blocs/theme/theme_bloc.dart';
import '../../../../core/constants/spacings.dart';
import '../../../../core/themes/app_color.dart';
import '../../../../widgets/leading_back_button_widget.dart';
import '../../data/models/message_page_extra.dart';
import '../widgets/avatar.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key, required this.data});

  final MessagePageExtraModel data;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.read<ThemeBloc>().state.isDarkMode;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: AppBackButton(),
        titleSpacing: 0.0,
        title: Row(
          children: [
            AvatarWidget(
              index: data.index,
              user: data.user,
            ),
            12.wS,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.user.name,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  data.isOnline ? 'online'.tr() : 'offline'.tr(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultHorPadding.w,
          ),
          child: Column(
            children: [
              22.hS,
              defaultBottomPadding.toInt().hS,
            ],
          ),
        ),
      ),
    );
  }
}
