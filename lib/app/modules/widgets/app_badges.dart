import 'package:frontend/app/lib_view.dart';

class AppBadges extends StatelessWidget {
  final String label;
  final Color color;
  final Color? textColor;
  final bool rounded;

  const AppBadges({super.key, required this.label, required this.color, this.textColor, this.rounded = false});

  const AppBadges.success({super.key, required this.label, this.rounded = false})
    : color = AppColor.success,
      textColor = null;
  const AppBadges.warning({super.key, required this.label, this.rounded = false})
    : color = AppColor.warning,
      textColor = null;
  const AppBadges.danger({super.key, required this.label, this.rounded = false})
    : color = AppColor.danger,
      textColor = null;
  const AppBadges.info({super.key, required this.label, this.rounded = false})
    : color = AppColor.info,
      textColor = null;
  const AppBadges.primary({super.key, required this.label, this.rounded = false})
    : color = AppColor.primary,
      textColor = null;
  const AppBadges.secondary({super.key, required this.label, this.rounded = false})
    : color = AppColor.secondary,
      textColor = null;
  const AppBadges.dark({super.key, required this.label, this.rounded = false})
    : color = AppColor.dark,
      textColor = null;
  const AppBadges.grey({super.key, required this.label, this.rounded = false})
    : color = AppColor.grey,
      textColor = null;

  AppBadges.successSoft({super.key, required this.label, this.rounded = false})
    : color = AppColor.success.withAlpha(40),
      textColor = AppColor.success.withAlpha(160);
  AppBadges.warningSoft({super.key, required this.label, this.rounded = false})
    : color = AppColor.warning.withAlpha(40),
      textColor = AppColor.warning.withAlpha(160);
  AppBadges.dangerSoft({super.key, required this.label, this.rounded = false})
    : color = AppColor.danger.withAlpha(40),
      textColor = AppColor.danger.withAlpha(160);
  AppBadges.infoSoft({super.key, required this.label, this.rounded = false})
    : color = AppColor.info.withAlpha(40),
      textColor = AppColor.info.withAlpha(160);
  AppBadges.primarySoft({super.key, required this.label, this.rounded = false})
    : color = AppColor.primary.withAlpha(40),
      textColor = AppColor.primary.withAlpha(160);
  AppBadges.secondarySoft({super.key, required this.label, this.rounded = false})
    : color = AppColor.secondary.withAlpha(40),
      textColor = AppColor.secondary.withAlpha(160);
  AppBadges.darkSoft({super.key, required this.label, this.rounded = false})
    : color = AppColor.dark.withAlpha(40),
      textColor = AppColor.dark.withAlpha(160);
  AppBadges.greySoft({super.key, required this.label, this.rounded = false})
    : color = AppColor.grey,
      textColor = AppColors.grey.text;

  AppBadges.white({super.key, required this.label, this.rounded = false})
    : color = AppColor.white.withAlpha(40),
      textColor = AppColors.grey.text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 40),
      decoration: BoxDecoration(
        color: color.lighten(),
        border: Border.all(color: color, width: 1),
        borderRadius: BorderRadius.circular(rounded ? 100 : 6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: label.text.bold.size(12).color(textColor ?? AppColor.white).height(1.2).align(TextAlign.center),
    );
  }
}

class AppBadgesOnOff extends StatelessWidget {
  final bool isOn;

  const AppBadgesOnOff({super.key, required this.isOn});

  @override
  Widget build(BuildContext context) {
    return isOn ? AppBadges.successSoft(label: 'เปิด') : AppBadges.dangerSoft(label: 'ปิด');
  }
}
