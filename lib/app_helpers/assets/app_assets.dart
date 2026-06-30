import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

class AppAssets {
  AppAssets._();

  static const _images = 'assets/images';
  static final Image splashLogo = Image.asset(
    height: double.infinity,
    width: double.infinity,
    '$_images/splash_logo.png',
  );

  static SvgPicture getSvg(String path) {
    return SvgPicture.asset(
      height: double.infinity,
      width: double.infinity,
      '$_images/$path',
    );
  }

  static final SvgPicture topWave = SvgPicture.asset(
    width: double.infinity,
    height: 200,
    '$_images/top_wave.svg',
  );

  static final SvgPicture bottomWave = SvgPicture.asset(
    width: 200,
    '$_images/bottom_wave.svg',
  );

  static final SvgPicture loginBg = SvgPicture.asset(
    '$_images/login_bg.svg',
    height: double.infinity,
    width: double.infinity,
  );

  static final SvgPicture splashImage = SvgPicture.asset(
    '$_images/splashhrms.svg',
  );
  static final SvgPicture hrmsText = SvgPicture.asset('$_images/hrms.svg');

  static final SvgPicture announcementEmpty = SvgPicture.asset(
    '$_icons/announcent_empty.svg',
  );

  static final SvgPicture checkIcon = SvgPicture.asset('$_icons/check.svg');

  ///. Bottom Navigation Icons
  static SvgPicture dashboardIcon({Color? color}) {
    return SvgPicture.asset(
      '$_icons/dashboard.svg',
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }

  static SvgPicture addIcon({Color? color}) {
    return SvgPicture.asset(
      '$_icons/bottomIcon.svg',
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }

  static SvgPicture profileIcon({Color? color}) {
    return SvgPicture.asset(
      '$_icons/profile.svg',
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }

  static SvgPicture tasksIcon({Color? color}) {
    return SvgPicture.asset(
      '$_icons/task-square.svg',
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }

  static SvgPicture attendanceIcon({Color? color}) {
    return SvgPicture.asset(
      '$_icons/calendar-2.svg',
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }

  ///. Bottom Navigation ends here

  static const _icons = 'assets/icons';

  static final SvgPicture toDoList = SvgPicture.asset('$_icons/to_do_list.svg');
  static final SvgPicture workHistory = SvgPicture.asset(
    '$_icons/work_history.svg',
  );
  static final SvgPicture tickets = SvgPicture.asset('$_icons/tickets.svg');
  static final SvgPicture subOrdinates = SvgPicture.asset(
    '$_icons/subordinates.svg',
  );
  static final SvgPicture reports = SvgPicture.asset('$_icons/reports.svg');
  static final SvgPicture payslips = SvgPicture.asset('$_icons/payslips.svg');
  static final SvgPicture meetings = SvgPicture.asset('$_icons/meetings.svg');
  static final SvgPicture leaves = SvgPicture.asset('$_icons/leaves.svg');
  static final SvgPicture kpi = SvgPicture.asset(
    '$_icons/kpi_dependenciea.svg',
  );
  static final SvgPicture hierachy = SvgPicture.asset('$_icons/hierachy.svg');
  static final SvgPicture console = SvgPicture.asset('$_icons/console.svg');
  static final SvgPicture broadcasts = SvgPicture.asset(
    '$_icons/broadcasts.svg',
  );
  static final SvgPicture approval = SvgPicture.asset('$_icons/approval.svg');
  static final SvgPicture activities = SvgPicture.asset(
    '$_icons/activites.svg',
  );
  static final SvgPicture training = SvgPicture.asset(
    '$_icons/training.svg',
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

  static final SvgPicture mail = SvgPicture.asset(
    '$_icons/sms.svg',
    width: 5,
    height: 5,
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

  static final SvgPicture password = SvgPicture.asset(
    '$_icons/lock.svg',
    width: 5,
    height: 5,
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

  static final SvgPicture documentManagerIcon = SvgPicture.asset(
    '$_icons/documents_manager.svg',
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

  static final SvgPicture calenderTick = SvgPicture.asset(
    '$_icons/calendar-tick.svg',
  );

  static final SvgPicture taskIcon = SvgPicture.asset(
    '$_icons/task-square.svg',
  );

  static final SvgPicture archiveBook = SvgPicture.asset(
    '$_icons/archive-book.svg',
  );

  static final SvgPicture noteIcon = SvgPicture.asset('$_icons/note copy.svg');
  static final SvgPicture calenderRoundec = SvgPicture.asset(
    '$_icons/calendar_rounded.svg',
  );
  static final SvgPicture empIcon = SvgPicture.asset('$_icons/emp_icon.svg');
  static final SvgPicture empContractIcon = SvgPicture.asset(
    '$_icons/directbox-notif.svg',
  );
  static final SvgPicture visaIcon = SvgPicture.asset('$_icons/Container.svg');
  static final SvgPicture backCheckIcon = SvgPicture.asset(
    '$_icons/Container (1).svg',
  );

  static final SvgPicture uploadIcon = SvgPicture.asset(
    '$_icons/direct-send.svg',
  );

  static final SvgPicture cameraIcon = SvgPicture.asset('$_icons/camera.svg');

  static final Image expenseIcon = Image.asset('$_icons/expenses.png');
  static final Image gatePassIcon = Image.asset('$_icons/gatepass.png');
  static final Image leaveIcon = Image.asset('$_icons/leave.png');
  static final Image subordinatesIcon = Image.asset('$_icons/subordinates.png');
  static final Image fieldpassIcon = Image.asset('$_icons/fieldpass.png');
  static final Image overtime = Image.asset('$_icons/overtime.png');
  static final Image loginbg = Image.asset('$_images/loginbg.png');
  static final Image appLogoIcon = Image.asset('$_images/app_logo.png');
  static final Image announcement = Image.asset('$_images/announcement.jpg');
  static final Image defaultAvatar = Image.asset('$_images/pp.png');
  static final Image profileElips = Image.asset(
    width: double.infinity,
    '$_images/profileElips.png',
    fit: BoxFit.contain,
  );
  static final SvgPicture userIcon = SvgPicture.asset(
    '$_icons/profile.svg',
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static final SvgPicture teamStructure = SvgPicture.asset(
    '$_icons/people.svg',
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static final SvgPicture jigroMembers = SvgPicture.asset(
    '$_icons/people.svg',
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static final SvgPicture settings = SvgPicture.asset(
    '$_icons/setting.svg',
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static final SvgPicture contactSupport = SvgPicture.asset(
    '$_icons/message-question.svg',
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static final SvgPicture termsAndConditions = SvgPicture.asset(
    '$_icons/menu-board.svg',
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static final SvgPicture privacyPolicy = SvgPicture.asset(
    '$_icons/shield-security.svg',
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static final SvgPicture logout = SvgPicture.asset(
    '$_icons/logout.svg',
    colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
}
