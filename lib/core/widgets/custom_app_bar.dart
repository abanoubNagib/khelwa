import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khelwa/core/helpers/extensions.dart';
import 'package:khelwa/core/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  final bool canBack;
  final String pageTitle;
  final Color? titleColor;
  final void Function()? onTap;

  const CustomAppBar({
    super.key,
    required this.pageTitle,
    this.titleColor,
    this.canBack = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (canBack)
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: InkWell(
              borderRadius: BorderRadius.circular(2.w),
              onTap: onTap ?? () => context.pop(),
              child: Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.w),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(0, 2.0),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                  size: 21.w,
                ),
              ),
            ),
          ),
        Center(
          child: CustomText(
            text: pageTitle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            color: titleColor ?? Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        // SizedBox(width: 30.w),
      ],
    );
  }
}
