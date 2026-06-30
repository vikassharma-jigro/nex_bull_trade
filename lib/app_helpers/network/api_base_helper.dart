import '../../model/auth_model.dart';
import '../../model/dashboard_model.dart';
import '../utils/shared_preferences.dart';
import 'api_client.dart';
import 'app_url.dart';

class AuthRepository {
  final ApiClient api;

  AuthRepository(this.api);


  Future<UserModel> login(
      String? phone,
      ) async {
    final response = await api.post(
      BASE_URL + loginUrl,
      bodyPerm: {
        "phone": phone
      },
    );
    return UserModel.fromJson(response);
  }

  Future<UserModel> verifyOtp(
      String? phone,
      String? otp,
      ) async {
    final response = await api.post(
      BASE_URL + verifyUrl,
      bodyPerm: {
        'phone': phone,
        'otp': otp
      },
    );

    final userModel = UserModel.fromJson(response);

    String? token = userModel.data?.token;

    final sp = await SpUtil.getInstance();

    await sp.putString(
      SpUtil.ACCESS_TOKEN,
      token ?? "",
    );


  //   Logger().i("""
  // 🔐 USER LOGIN DATA SAVED:
  // ➡ ACCESS_TOKEN : ${token ?? ""}
  // ➡ IS_LOGGED_IN : ${token != null} """);

    return userModel;
  }


  Future<UserModel> setMpinApi(
      String? mpin,
      String? mpin_confirmation,
      ) async {
    final response = await api.post(
      BASE_URL + setMpinUrl,
      bodyPerm: {
        'mpin': mpin,
        'mpin_confirmation': mpin_confirmation,
      },
    );

    final userModel = UserModel.fromJson(response);

    String? token = userModel.data?.token;

    final sp = await SpUtil.getInstance();

    await sp.putString(
      SpUtil.ACCESS_TOKEN,
      token ?? "",
    );


  //   Logger().i("""
  // 🔐 USER LOGIN DATA SAVED:
  // ➡ ACCESS_TOKEN : ${token ?? ""}
  // ➡ IS_LOGGED_IN : ${token != null} """);

    return userModel;
  }

  Future<UserModel> verifyMpinApi(
      String? mpin,
      String? phone,
      ) async {
    final response = await api.post(
      BASE_URL + verifyMpinUrl,
      bodyPerm: {
        'mpin': mpin,
        'phone': phone,
      },
    );

    final userModel = UserModel.fromJson(response);

    String? token = userModel.data?.token;

    final sp = await SpUtil.getInstance();

    await sp.putString(
      SpUtil.ACCESS_TOKEN,
      token ?? "",
    );


  //   Logger().i("""
  // 🔐 USER LOGIN DATA SAVED:
  // ➡ ACCESS_TOKEN : ${token ?? ""}
  // ➡ IS_LOGGED_IN : ${token != null} """);

    return userModel;
  }

  Future<UserModel> forgetMpinApi(
      String? phone,
      ) async {
    final response = await api.post(
      BASE_URL + forgotMpinUrl,
      bodyPerm: {
        'phone': phone,
      },
    );

    final userModel = UserModel.fromJson(response);

    String? token = userModel.data?.token;

    final sp = await SpUtil.getInstance();

    await sp.putString(
      SpUtil.ACCESS_TOKEN,
      token ?? "",
    );


  //   Logger().i("""
  // 🔐 USER LOGIN DATA SAVED:
  // ➡ ACCESS_TOKEN : ${token ?? ""}
  // ➡ IS_LOGGED_IN : ${token != null} """);

    return userModel;
  }

  Future<UserModel> resetMpinApi(
      String? phone,
      String? otp,
      String? mpin,
      String? mpin_confirmation,
      ) async {
    final response = await api.post(
      BASE_URL + resetMpinUrl,
      bodyPerm: {
        'phone': phone,
        "otp": otp,
        "mpin": mpin,
        "mpin_confirmation": mpin_confirmation
      },
    );

    final userModel = UserModel.fromJson(response);

    String? token = userModel.data?.token;

    final sp = await SpUtil.getInstance();

    await sp.putString(
      SpUtil.ACCESS_TOKEN,
      token ?? "",
    );


  //   Logger().i("""
  // 🔐 USER LOGIN DATA SAVED:
  // ➡ ACCESS_TOKEN : ${token ?? ""}
  // ➡ IS_LOGGED_IN : ${token != null} """);

    return userModel;
  }

  Future<UserModel> kycApi(
      String? name,
      String? aadhaar_number,
      String? pan_number,
      String? ifsc_code,
      String? account_number,
      ) async {
    final response = await api.post(
      BASE_URL + kycUrl,
      bodyPerm: {
        'name': name,
        "pan_number": pan_number,
        "aadhaar_number": aadhaar_number,
        "ifsc_code": ifsc_code,
        "account_number": account_number
      },
    );

    final userModel = UserModel.fromJson(response);

    String? token = userModel.data?.token;

    final sp = await SpUtil.getInstance();

    await sp.putString(
      SpUtil.ACCESS_TOKEN,
      token ?? "",
    );


  //   Logger().i("""
  // 🔐 USER LOGIN DATA SAVED:
  // ➡ ACCESS_TOKEN : ${token ?? ""}
  // ➡ IS_LOGGED_IN : ${token != null} """);

    return userModel;
  }

  Future<DashboardModel> dashboardApi() async {
    final response = await api.get(BASE_URL + dashboardUrl);
    return DashboardModel.fromJson(response);
  }
  // ✅ Helper — int ya String dono safely handle karta hai
  int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }






  // Auth APIs
 /* Future<UserModel> login(
    String? email,
    String? empCode,
    String? password,
    String? device,
  ) async {
    final response = await api.post(
      BASE_URL + wholesalerLoginUrl,
      bodyPerm: {
        "userName": email,
        "employeeCode": empCode,
        "userPassword": password,
        "mobDeviceId": device,
      },
    );

    final data = response["resultData"];
    final user = data["userDetails"];

    String? token = data["token"];

    // ✅ FIX: JSON value int ya String dono ho sakta hai — safely parse karo
    int? employeeId = _parseInt(user["employeeId"]);
    int? userId = _parseInt(user["userId"]);
    int? roleId = _parseInt(user["roleId"]);
    int? organizationId = _parseInt(user["organizationId"]);

    String? userName = user["userName"]?.toString();
    String? role = user["roleName"]?.toString();
    String? fullName = user["fullName"]?.toString();
    String? organizationName = user["organizationName"]?.toString();

    // Save in SharedPreferences
    final sp = await SpUtil.getInstance();

    await sp.putString(SpUtil.ACCESS_TOKEN, token ?? "");
    await sp.putBool(SpUtil.IS_LOGGED_IN, token != null);
    await sp.putInt(SpUtil.EMPLOYEE_ID, employeeId ?? 0);
    await sp.putInt(SpUtil.MEMBER_ID, userId ?? 0);
    await sp.putInt(SpUtil.ROLE_ID, roleId ?? 0);
    await sp.putInt(SpUtil.ORGANIZATION_ID, organizationId ?? 0);
    await sp.putString(SpUtil.ORGANIZATION_NAME, organizationName ?? '');
    await sp.putString(SpUtil.ROLE, role ?? '');
    await sp.putString(SpUtil.USERNAME, userName ?? '');
    await sp.putString(SpUtil.FULLNAME, fullName ?? '');
    await sp.putString(SpUtil.MOBILE_IP, device ?? '');

    Logger().i("""
  🔐 USER LOGIN DATA SAVED:
  ➡ ACCESS_TOKEN : ${token ?? ""}
  ➡ IS_LOGGED_IN : ${token != null}
  ➡ EMPLOYEE_ID  : ${employeeId ?? 0}
  ➡ MEMBER_ID    : ${userId ?? 0}
  ➡ ROLE_ID      : ${roleId ?? 0}
  ➡ ORGANIZATION_ID   : ${organizationId ?? 0}   // ✅ fixed typo
  ➡ ORGANIZATION_NAME : ${organizationName ?? ''}
  ➡ USERNAME     : ${userName ?? ''}
  ➡ FULLNAME     : ${fullName ?? ''}
  ➡ MOBILE_IP    : ${device ?? ''}
  """);

    return UserModel.fromJson(response);
  }

  // ✅ Helper — int ya String dono safely handle karta hai
  int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  /// Check If User checkIn or CheckOut
  Future<Map<String, dynamic>> checkInOutStatus({
    int? organizationId,
    String? punchTime,
    double? latitude,
    double? longitude,
    bool? isCheckIn,
    int? employeeId,
    String? mobdeviceId,
    int? userId,
  }) async {
    final response = await api.post(
      BASE_URL + punchInOutUrl,
      bodyPerm: {
        "organizationId": organizationId,
        "punchTime": punchTime,
        "latitude": latitude,
        "longitude": longitude,
        "isCheckIn": isCheckIn,
        "mobdeviceId": mobdeviceId,
        "userId": userId,
        "employeeId": employeeId,
      },
    );

    return response;
  }

  Future<dynamic> logout() async {
    final response = await api.post(BASE_URL + logoutUrl);
    return response;
  }

  // Dashboard APIs
  Future<DashboardModel> dashboardApi(
    int? employeeId,
    String? attendanceDate,
  ) async {
    final response = await api.post(
      BASE_URL + dashboardUrl,
      bodyPerm: {"employeeId": employeeId, "attendanceDate": attendanceDate},
    );
    return DashboardModel.fromJson(response);
  }

  Future<TeamAttendanceModel> getTeamAttendanceByDateApi({
    int? employeeId,
    String? attendanceDate,
    var filterType,
  }) async {
    final body = {
      "employeeId": employeeId,
      "attendanceDate": attendanceDate,
      "filterType": filterType,
    };
    Logger().i("ATTENDANCE BY DATE API BODY: $body");

    final response = await api.post(
      BASE_URL + teamAttendanceUrl,
      bodyPerm: body,
    );

    return TeamAttendanceModel.fromJson(response);
  }

  Future<DateWiseAttendanceModel> dateWiseAttendanceApi(
    String? employeeId,
    String? attendanceDate,
  ) async {
    final response = await api.post(
      BASE_URL + dateWiseAttendanceUrl,
      bodyPerm: {"employeeId": employeeId, "attendanceDate": attendanceDate},
    );
    return DateWiseAttendanceModel.fromJson(response);
  }

  Future<DashboardModel> importantTaskApi(
    String? employeeId,
    String? attendanceDate,
  ) async {
    final response = await api.post(
      BASE_URL + importantTaskUrl,
      bodyPerm: {"employeeId": employeeId, "attendanceDate": attendanceDate},
    );
    return DashboardModel.fromJson(response);
  }

  // Todo APIs
  Future<ToDoListModel> getToDoListApi(
    String? employeeId,
    var startIndex,
    var pageSize,
    var searchText,
    var draw,
    var isStatus,
    List<int> categoryWise,
  ) async {
    final response = await api.post(
      BASE_URL + toDoListUrl,
      bodyPerm: {
        "startIndex": startIndex,
        "pageSize": pageSize,
        // "SearchText": searchText,
        "employeeId": employeeId,
        "draw": draw,
        "isStatus": isStatus,
        "categoryWise": categoryWise,
      },
    );
    return ToDoListModel.fromJson(response);
  }

  Future<ToDoListModel> getToDoCategoryWiseApi(
    String? employeeId,
    var startIndex,
    var pageSize,
    var searchText,
    var draw,
    var isStatus,
    List<int> categoryWise,
  ) async {
    final response = await api.post(
      BASE_URL + toDoCategoryWiseUrl,
      bodyPerm: {
        "startIndex": startIndex,
        "pageSize": pageSize,
        // "SearchText": searchText,
        "employeeId": employeeId,
        "draw": draw,
        "isStatus": isStatus,
        "categoryWise": categoryWise,
      },
    );
    return ToDoListModel.fromJson(response);
  }

  Future<ToDoCategoryModel> getToDoCategoryApi() async {
    final response = await api.get(BASE_URL + toDoCategoryUrl);
    return ToDoCategoryModel.fromJson(response);
  }

  Future<ToDoListModel> saveTodoApi({
    int? toDoID,
    int? employeeID,
    String? description,
    String? tat,
    int? categoryId,
    int? isNextDueOff,
    String? remarks,
    int? isCriticalActivity,
    int? openedCheckedByID,
    String? observers,
    int? isStatus,
    String? createdOn,
    String? updatedOn,
  }) async {
    final response = await api.post(
      BASE_URL + saveTodoUrl,
      bodyPerm: {
        "toDoID": toDoID,
        "employeeID": employeeID,
        "description": description,
        "tat": tat,
        "categoryId": categoryId,
        "isNextDueOff": isNextDueOff,
        "remarks": remarks,
        "isCriticalActivity": isCriticalActivity,
        "openedCheckedByID": openedCheckedByID,
        "observers": observers,
        "isStatus": isStatus,
        "createdOn": createdOn,
        "updatedOn": updatedOn,
      },
    );
    return ToDoListModel.fromJson(response);
  }

  // Overtime APIs
  Future<GetOvertimeModel> getOvertimeRequestApi(
    var status,
    String? employeeId,
  ) async {
    final response = await api.get(
      query: {"Status": status, "EmployeeId": employeeId},
      BASE_URL + revdOvertimeRequestsUrl,
    );
    return GetOvertimeModel.fromJson(response);
  }

  // KPI APIs
  Future<String> saveKpiApi({
    int? kpiid,
    int? employeeId,
    String? description,
    String? dueDate,
    int? openBeforeDays,
    String? filledBy,
    String? remarks,
    String? doneType,
    String? targetType,
    String? createOn,
    int? createdBy,
    String? ip,
    int? isStatus,
  }) async {
    final response = await api.post(
      BASE_URL + saveKpiUrl,
      bodyPerm: {
        "Kpiid": kpiid ?? 0,
        "EmployeeId": employeeId ?? 0,
        "Description": description ?? '',
        "DueDate": dueDate ?? '',
        "OpenBeforeDays": openBeforeDays ?? 0,
        "FilledBy": filledBy ?? '',
        "Remarks": remarks ?? '',
        "DoneType": doneType ?? '',
        "TargetType": targetType ?? '',
        "CreateOn": createOn ?? '',
        "CreatedBy": createdBy ?? 0,
        "Ip": ip ?? '',
        "IsStatus": isStatus ?? 1,
      },
    );
    return response["message"];
  }

  Future<KpiItem> getYourKpiByStatusApi(
    var startIndex,
    var pageSize,
    String? searchText,
    int? employeeId,
    int? organizationId,
    String? draw,
    int? status,
  ) async {
    final response = await api.get(
      BASE_URL + yourKpiByStatusUrl,
      query: {
        "StartIndex": startIndex,
        "PageSize": pageSize,
        "EmployeeId": employeeId,
        "OrganizationId": organizationId,
        //"Draw": draw ?? '',
        "Status": status,
      },
    );
    return KpiItem.fromJson(response);
  }

  // Profile APIs
  Future<ProfileModel> postProfile(int? employeeId) async {
    final response = await api.get("$BASE_URL$postProfileUrl/$employeeId");
    return ProfileModel.fromJson(response);
  }

  Future<ProfileModel> editProfile({
    int? employeeId,
    String? firstName,
    String? lastName,
    String? dob,
    int? createdBy,
    String? ipAddress,
  }) async {
    final response = await api.post(
      BASE_URL + profileEditUrl,
      bodyPerm: {
        "employeeId": employeeId,
        "firstName": firstName,
        "lastName": lastName,
        "dob": dob,
        "createdBy": createdBy,
        "ipAddress": ipAddress,
      },
    );
    return ProfileModel.fromJson(response);
  }

  // Activity APIs
  Future<GetFrequencyModel> getFrequency() async {
    final response = await api.get(BASE_URL + getFrequencyUrl);
    return GetFrequencyModel.fromJson(response);
  }

  Future<ActivityCategoryModel> getActivityCategory() async {
    final response = await api.get(BASE_URL + getActivityCategoryUrl);
    return ActivityCategoryModel.fromJson(response);
  }

  Future<ActivityModel> postActivity(
    int? employeeId,
    int? startIndex,
    int? pageSize,
    String? searchText,
    String? draw,
    int? status,
    int? isStatus,
    List<int> categoryWise,
  ) async {
    final response = await api.post(
      BASE_URL + postActivityUrl,
      bodyPerm: {
        "employeeId": employeeId,
        "startIndex": startIndex,
        "pageSize": pageSize,
        // "SearchText": searchText,
        "draw": draw,
        "status": status,
        "isStatus": isStatus,
        "categoryWise": categoryWise,
      },
    );
    return ActivityModel.fromJson(response);
  }

  Future<ActivityModel> saveActivityApi({
    int? employeeID,
    String? description,
    String? tat,
    int? frequencyId,
    int? categoryId,
    bool? isDescriptionEnabled,
    String? remarks,
    bool? isCriticalActivity,
    int? openedCheckedBy,
    int? observersID,
    int? createdBy,
    String? createdDate,
    String? ip,
  }) async {
    final response = await api.post(
      BASE_URL + saveActivityUrl,
      bodyPerm: {
        "employeeID": employeeID,
        "description": description,
        "tat": tat,
        "frequencyId": frequencyId,
        "categoryId": categoryId,
        "isDescriptionEnabled": isDescriptionEnabled,
        "remarks": remarks,
        "isCriticalActivity": isCriticalActivity,
        "openedCheckedBy": openedCheckedBy,
        "observersID": observersID,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "ip": ip,
      },
    );
    return ActivityModel.fromJson(response);
  }

  // Broadcast APIs
  Future<BroadcastModel> getBroadcastApi(
    var employeeId,
    var startIndex,
    var pageSize,
    var searchText,
    var draw,
    var isStatus,
  ) async {
    final response = await api.post(
      BASE_URL + broadcastUrl,
      bodyPerm: {
        "startIndex": startIndex,
        "pageSize": pageSize,
        // "SearchText": searchText,
        "employeeId": employeeId,
        "draw": draw,
        "isStatus": isStatus,
      },
    );
    return BroadcastModel.fromJson(response);
  }

  Future<BroadcastModel> addBroadcastApi({
    var broadCastID,
    var employeeID,
    var message,
    var recipients,
    var visibleDays,
    var attachments,
    var createdBy,
    var createdOn,
    var ip,
  }) async {
    final response = await api.post(
      BASE_URL + addBroadcastUrl,
      bodyPerm: {
        "broadCastID": broadCastID,
        "employeeID": employeeID,
        "message": message,
        "recipients": recipients,
        "visibleDays": visibleDays,
        "attachments": attachments,
        "createdBy": createdBy,
        "createdOn": createdOn,
        "ip": ip,
      },
    );
    return BroadcastModel.fromJson(response);
  }

  Future<BroadcastModel> editBroadcastApi({
    var broadCastID,
    var employeeID,
    var message,
    var recipients,
    var visibleDays,
    var attachments,
    var createdBy,
    var createdOn,
    var ip,
  }) async {
    final response = await api.post(
      BASE_URL + editBroadcastUrl,
      bodyPerm: {
        "broadCastID": broadCastID,
        "employeeID": employeeID,
        "message": message,
        "recipients": recipients,
        "visibleDays": visibleDays,
        "attachments": attachments,
        "createdBy": createdBy,
        "createdOn": createdOn,
        "ip": ip,
      },
    );
    return BroadcastModel.fromJson(response);
  }

  Future<RecipientsModel> getRecipientsListApi() async {
    final response = await api.get(BASE_URL + recipientsListUrl);
    return RecipientsModel.fromJson(response);
  }

  // Leave APIs
  Future<LeaveListModel> getLeaveListApi(
    var startIndex,
    var pageSize,
    var employeeId,
    var organizationId,
    var draw,
    var status,
  ) async {
    final response = await api.get(
      query: {
        "StartIndex": startIndex,
        "PageSize": pageSize,
        // // "SearchText": searchText,
        "EmployeeId": employeeId,
        "OrganizationId": organizationId,
        "Draw": draw ?? '',
        "Status": status,
      },
      BASE_URL + leaveListUrl,
    );
    return LeaveListModel.fromJson(response);
  }

  Future<TeamLeaveListModel> getTeamLeaveListApi(
    var RoleId,
    var employeeId,
    var organizationId,
    var status,
  ) async {
    final response = await api.get(
      query: {
        "RoleId": RoleId,
        "EmployeeId": employeeId,
        "OrganizationId": organizationId,
        "Status": status,
      },
      BASE_URL + teamLeaveUrl,
    );
    return TeamLeaveListModel.fromJson(response);
  }

  Future<ApplyLeaveModel> getTeamLeaveApproveApi(
    var leaveId,
    var employeeId,
    var organizationId,
    var userId,
    var mobdeviceId,
  ) async {
    final response = await api.post(
      bodyPerm: {
        "leaveId": leaveId,
        "employeeId": employeeId,
        "organizationId": sp?.getInt(SpUtil.ORGANIZATION_ID),
        "userId": sp?.getInt(SpUtil.MEMBER_ID),
        "mobdeviceId": mobdeviceId,
      },
      BASE_URL + teamLeaveApproveUrl,
    );
    return ApplyLeaveModel.fromJson(response);
  }

  Future<ApplyLeaveModel> getTeamLeaveRejectApi(
    var leaveId,
    var employeeId,
    var organizationId,
    var userId,
    var mobdeviceId,
    var disapprovalRemarks,
  ) async {
    final response = await api.post(
      bodyPerm: {
        "leaveApplicationId": leaveId,
        "employeeId": employeeId,
        "organizationId": sp?.getInt(SpUtil.ORGANIZATION_ID),
        "userId": sp?.getInt(SpUtil.MEMBER_ID),
        "mobdeviceId": mobdeviceId,
        "disapprovalRemarks": disapprovalRemarks,
      },
      BASE_URL + teamLeaveRejectUrl,
    );
    return ApplyLeaveModel.fromJson(response);
  }

  /// Attendance Module
  // Future<EmployeeTimeSheetModel> timesheetApi(
  //   int? month,
  //   int? year,
  //   int? employeeId,
  //   int? organizationId,
  // ) async {
  //   final uri = Uri.parse("$BASE_URL$employeeTimeSheetUrl").replace(
  //     queryParameters: {
  //       "Month": (month ?? DateTime.now().month).toString(),
  //       "Year": (year ?? DateTime.now().year).toString(),
  //       "EmployeeId": employeeId?.toString() ?? "",
  //       "OrganizationId": organizationId?.toString() ?? "",
  //     },
  //   );

  //   final response = await api.post(uri.toString(), bodyPerm: {});

  //   return EmployeeTimeSheetModel.fromJson(response);
  // }

  Future<EmployeeTimeSheetModel> timesheetApi(
    int? month,
    int? year,
    int? employeeId,
    int? organizationId,
  ) async {
    final body = {
      "Month": (month != null && month > 0 && month <= 12)
          ? month
          : DateTime.now().month,
      "Year": year ?? DateTime.now().year,
      "EmployeeId": employeeId,
      "OrganizationId": organizationId,
    };
    Logger().i("TIMESHEET API BODY: $body");

    final response = await api.post(
      BASE_URL + employeeTimeSheetUrl,
      bodyPerm: body,
    );

    return EmployeeTimeSheetModel.fromJson(response);
  }

  /// Get Attendance by date
  Future<GetAttendanceByDateModel> getAttendanceByDateApi({
    int? employeeId,
    String? attendanceDate,
  }) async {
    final body = {"employeeId": employeeId, "attendanceDate": attendanceDate};
    Logger().i("ATTENDANCE BY DATE API BODY: $body");

    final response = await api.post(
      BASE_URL + getAttendanceUrl,
      bodyPerm: body,
    );

    return GetAttendanceByDateModel.fromJson(response);
  }

  Future<AttendanceCalenderModel> getAttendanceByCalenderDateApi({
    int? employeeId,
    var month,
    var year,
    var organizationId,
  }) async {
    final body = {
      "employeeId": employeeId,
      "month": month,
      "year": year,
      "organizationId": organizationId,
    };
    Logger().i("ATTENDANCE BY DATE API BODY: $body");

    final response = await api.post(
      BASE_URL + attendanceCalenderUrl,
      bodyPerm: body,
    );

    return AttendanceCalenderModel.fromJson(response);
  }

  Future<GetAttendanceByDateModel> getAttendanceRequestApi({
    int? employeeId,
    String? attendanceDate,
    String? attendanceTime,
    String? reason,
    String? description,
    var requestType,
    var statusId,
  }) async {
    final body = {
      "employeeId": employeeId,
      "attendanceDate": attendanceDate,
      "attendanceTime": attendanceTime,
      "reason": reason,
      "description": description,
      "requestType": requestType,
      "statusId": statusId,
    };
    Logger().i("ATTENDANCE BY DATE API BODY: $body");

    final response = await api.post(
      BASE_URL + attendanceRequestUrl,
      bodyPerm: body,
    );

    return GetAttendanceByDateModel.fromJson(response);
  }

  Future<LeaveTypeModel> getLeaveTypesApi(int? organizationId) async {
    final response = await api.get(
      query: {"organizationId": organizationId ?? 0},
      BASE_URL + leaveTypesUrl,
    );
    return LeaveTypeModel.fromJson(response);
  }

  Future<LeaveDetailsModel> getLeaveDetailsApi(int? leaveApplicationId) async {
    final response = await api.post(
      BASE_URL + leaveDetailsUrl,
      bodyPerm: {"leaveApplicationId": leaveApplicationId},
    );
    return LeaveDetailsModel.fromJson(response);
  }

  Future<ApplyLeaveModel> applyLeaveMobileApi({
    int? leaveTypeId,
    String? fromDate,
    String? toDate,
    String? reason,
    String? description,
    List<Map<String, dynamic>>? leaveDetails,
    int? employeeId,
    int? userMasterId,
    int? leaveApplicationId,
  }) async {
    final response = await api.post(
      BASE_URL + applyLeaveMobileUrl,
      bodyPerm: {
        "leaveTypeId": leaveTypeId,
        "fromDate": fromDate,
        "toDate": toDate,
        "reason": reason,
        "description": description,
        "leaveDetails": leaveDetails,
        "employeeId": employeeId,
        "userMasterId": userMasterId,
        "leaveApplicationId": leaveApplicationId,
      },
    );
    return ApplyLeaveModel.fromJson(response);
  }

  Future<ApplyLeaveModel> updateLeaveMobileApi({
    int? leaveTypeId,
    String? fromDate,
    String? toDate,
    String? reason,
    String? description,
    List<Map<String, dynamic>>? leaveDetails,
    int? employeeId,
    int? userMasterId,
    int? leaveApplicationId,
  }) async {
    final response = await api.post(
      BASE_URL + updateLeaveMobileUrl,
      bodyPerm: {
        "leaveTypeId": leaveTypeId,
        "fromDate": fromDate,
        "toDate": toDate,
        "reason": reason,
        "description": description,
        "leaveDetails": leaveDetails,
        "employeeId": employeeId,
        "userMasterId": userMasterId,
        "leaveApplicationId": leaveApplicationId,
      },
    );
    return ApplyLeaveModel.fromJson(response);
  }

  // Notification APIs
  Future<NotifcationCountModel> getNotificationCountApi() async {
    final response = await api.get(BASE_URL + notificationCountUrl);
    return NotifcationCountModel.fromJson(response);
  }

  Future<NotifcationListModel> getNotificationListApi(
    var startIndex,
    var pageSize,
    //String? searchText,
    int? employeeId,
    int? organizationId,
    String? draw,
    int? status,
  ) async {
    final response = await api.get(
      query: {
        "StartIndex": startIndex,
        "PageSize": pageSize,
        // // "SearchText": searchText,
        "EmployeeId": employeeId,
        "OrganizationId": organizationId,
        "Draw": draw ?? '',
        "Status": status,
      },
      BASE_URL + notificationListUrl,
    );
    return NotifcationListModel.fromJson(response);
  }

  Future<MarkAsReadNotificationModel> markNotificationReadApi(
    int? notificationId,
  ) async {
    final response = await api.post(
      BASE_URL + markNotificationReadUrl,
      bodyPerm: {"notificationId": notificationId},
    );
    return MarkAsReadNotificationModel.fromJson(response);
  }

  // Request APIs (Expenses, FieldPass, GatePass)
  Future<GetExpenses> getRevdExpenseRequestsApi(
    var startIndex,
    var pageSize,
    String? searchText,
    int? employeeId,
    int? organizationId,
    String? draw,
    int? status,
  ) async {
    final response = await api.get(
      query: {
        "StartIndex": startIndex,
        "PageSize": pageSize,
        // "SearchText": searchText,
        "EmployeeId": employeeId,
        "OrganizationId": organizationId,
        "Draw": draw ?? '',
        "Status": status,
      },
      BASE_URL + revdExpenseRequestsUrl,
    );
    return GetExpenses.fromJson(response);
  }

  Future<CreateExpenseModel> createExpenseApi({
    int? employeeId,
    String? description,
    String? expenseOn,
    String? expenseType,
    double? amount,
    String? remark,
  }) async {
    final response = await api.post(
      BASE_URL + createExpenseUrl,
      bodyPerm: {
        "employeeId": employeeId,
        "description": description,
        "expenseOn": expenseOn,
        "expenseType": expenseType,
        "amount": amount,
        "remark": remark,
      },
    );
    return CreateExpenseModel.fromMap(response);
  }

  Future<UpdateExpenseStatusModel> updateExpenseStatusApi({
    int? expensesId,
    int? statusId,
    String? remarks,
  }) async {
    final response = await api.post(
      BASE_URL + updateExpenseStatusUrl,
      bodyPerm: {
        "expensesId": expensesId,
        "statusId": statusId,
        "remarks": remarks,
      },
    );
    return UpdateExpenseStatusModel.fromJson(response);
  }

  Future<GetFieldPassModel> getRevdFieldPassRequestsApi(
    var startIndex,
    var pageSize,
    String? searchText,
    int? employeeId,
    int? organizationId,
    String? draw,
    int? status,
  ) async {
    final response = await api.get(
      query: {
        "StartIndex": startIndex,
        "PageSize": pageSize,
        // "SearchText": searchText,
        "EmployeeId": employeeId,
        "OrganizationId": organizationId,
        "Draw": draw ?? '',
        "Status": status,
      },
      BASE_URL + revdFieldPassRequestsUrl,
    );
    return GetFieldPassModel.fromJson(response);
  }

  Future<CreateFieldPassModel> createFieldPassApi({
    int? employeeId,
    String? passDate,
    String? passType,
    String? reason,
    String? remark,
  }) async {
    final response = await api.post(
      BASE_URL + createFieldPassUrl,
      bodyPerm: {
        "employeeId": employeeId,
        "passDate": passDate,
        "passType": passType,
        "reason": reason,
        "remark": remark,
      },
    );
    if (response is String) {
      return CreateFieldPassModel.fromJson(response);
    }
    return CreateFieldPassModel.fromMap(Map<String, dynamic>.from(response));
  }

  Future<UpdateFieldPassModel> updateFieldPassStatusApi({
    int? fieldPassId,
    int? statusId,
    String? remarks,
  }) async {
    final response = await api.post(
      BASE_URL + updateFieldPassStatusUrl,
      bodyPerm: {
        "fieldPassId": fieldPassId,
        "statusId": statusId,
        "remarks": remarks,
      },
    );
    if (response is String) {
      return UpdateFieldPassModel.fromJson(response);
    }
    return UpdateFieldPassModel.fromMap(Map<String, dynamic>.from(response));
  }

  Future<GetGatePassModel> getRevdGatePassRequestsApi(
    var startIndex,
    var pageSize,
    String? searchText,
    int? employeeId,
    int? organizationId,
    String? draw,
    int? status,
  ) async {
    final response = await api.get(
      query: {
        "StartIndex": startIndex,
        "PageSize": pageSize,
        // "SearchText": searchText,
        "EmployeeId": employeeId,
        "OrganizationId": organizationId,
        "Draw": draw ?? '',
        "Status": status,
      },
      BASE_URL + revdGatePassRequestsUrl,
    );
    return GetGatePassModel.fromJson(response);
  }

  Future<CreateGatePassModel> createGatePassApi({
    int? employeeId,
    String? requestDuration,
    String? reason,
    String? remarks,
  }) async {
    final response = await api.post(
      BASE_URL + createGatePassUrl,
      bodyPerm: {
        "employeeId": employeeId,
        "requestDuration": requestDuration,
        "reason": reason,
        "remarks": remarks,
      },
    );
    return CreateGatePassModel.fromJson(response);
  }

  Future<CreateGatePassModel> updateGatePassStatusApi({
    int? gatePassId,
    int? statusId,
    String? remarks,
  }) async {
    final response = await api.post(
      BASE_URL + updateGatePassStatusUrl,
      bodyPerm: {
        "gatePassId": gatePassId,
        "statusId": statusId,
        "remarks": remarks,
      },
    );
    return CreateGatePassModel.fromJson(response);
  }

  // Holiday APIs
  Future<GetHolidayList> getHolidayListApi(
    // var startIndex,
    // var pageSize,
    // String? searchText,
    // int? employeeId,
    int? organizationId,
    // String? draw,
    // int? status,
  ) async {
    final response = await api.get(
      query: {
        // "StartIndex": startIndex,
        // "PageSize": pageSize,
        // // "SearchText": searchText,
        // "EmployeeId": employeeId,
        "OrganizationId": organizationId,
        // "Draw": draw ?? '',
        // "Status": status,
      },
      BASE_URL + holidayListUrl,
    );
    return GetHolidayList.fromJson(response);
  }

  Future<GetCalenderModel> getHolidayCalendarApi(int? organizationId) async {
    final response = await api.get(
      BASE_URL + holidayCalendarUrl,
      query: {'organizationId': organizationId ?? 0},
    );
    return GetCalenderModel.fromJson(response);
  }

  // Subordinates APIs
  Future<GetSubordinatesModel> getSubordinatesTreeApi() async {
    final response = await api.get(BASE_URL + subordinatesTreeUrl);
    return GetSubordinatesModel.fromJson(response);
  }

  // Common APIs
  Future<CommanCateogryModel> getCommonCategoryApi() async {
    final response = await api.get(BASE_URL + commonCategoryUrl);
    return CommanCateogryModel.fromJson(response);
  }

  Future<GetFrequencyModel> getCommonFrequencyListApi() async {
    final response = await api.get(BASE_URL + commonFrequencyUrl);
    return GetFrequencyModel.fromJson(response);
  }

  Future<CommonEmployeeListModel> getCommonEmployeeListApi(
    int? organizationId,
  ) async {
    final response = await api.get(
      BASE_URL + commonEmployeeUrl,
      query: {'organizationId': organizationId ?? 0},
    );
    return CommonEmployeeListModel.fromJson(response);
  }

  Future<dynamic> uploadImageApi({
    required String employeeId,
    required File file,
  }) async {
    final formData = FormData.fromMap({
      'EmployeeId': employeeId,
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split(Platform.pathSeparator).last,
      ),
    });

    final response = await api.postMultipart(
      BASE_URL + uploadImageUrl,
      formData: formData,
    );
    return response;
  }

  Future<dynamic> saveEmployeeDocumentApi({
    required String employeeDocumentId,
    required String employeeId,
    required String documentName,
    required String documentNumber,
    required File file,
    required String mobDeviceIdfile,
  }) async {
    final formData = FormData.fromMap({
      'EmployeeDocumentId': employeeDocumentId,
      'EmployeeId': employeeId,
      'DocumentName': documentName,
      'DocumentNumber': documentNumber,
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split(Platform.pathSeparator).last,
      ),
      'MobDeviceId': mobDeviceIdfile,
    });

    final response = await api.postMultipart(
      BASE_URL + employeeDocumentSaveUrl,
      formData: formData,
    );
    return response;
  }

  Future<TeamAttendanceRequestModel> getTeamAttendanceRequestListApi(
    int? employeeId, {
    bool isTeam = true,
  }) async {
    final response = await api.get(
      BASE_URL + teamAttendanceRequestUrl,
      //query: {isTeam ? "managerId" : "employeeId": employeeId},
      query: {"managerId": employeeId},
    );
    return TeamAttendanceRequestModel.fromJson(response);
  }

  Future<ApplyLeaveModel> approveAttendanceRequestApi(
    int attendanceRequestId,
    int orgID,
  ) async {
    final response = await api.post(
      '$BASE_URL$approveAttendanceRequestUrl?attendanceRequestId=$attendanceRequestId&organizationId=$orgID',
    );
    return ApplyLeaveModel.fromJson(response);
  }

  Future<ApplyLeaveModel> rejectAttendanceRequestApi(
    int attendanceRequestId,
  ) async {
    final organizationId = sp?.getInt(SpUtil.ORGANIZATION_ID);
    final response = await api.post(
      '$BASE_URL$rejectAttendanceRequestUrl?attendanceRequestId=$attendanceRequestId&organizationId=$organizationId',
    );
    return ApplyLeaveModel.fromJson(response);
  }

  Future<EmployeeDocumentModel> getEmployeeDocumentListApi(
    int? employeeId,
  ) async {
    final response = await api.get(
      BASE_URL + employeeDocumentListUrl,
      query: {"employeeId": employeeId},
    );
    return EmployeeDocumentModel.fromJson(response);
  }

  // Meeting APIs
  Future<MeetingListModel> getMeetingListApi(
    var startIndex,
    var pageSize,
    String? searchText,
    int? employeeId,
    int? organizationId,
    String? draw,
    int? status,
    String? tab,
  ) async {
    final response = await api.get(
      query: {
        "StartIndex": startIndex,
        "PageSize": pageSize,
        // "SearchText": searchText,
        "EmployeeId": employeeId,
        "OrganizationId": organizationId,
        "Draw": draw ?? '',
        "Status": status,
        "tab": tab,
      },
      BASE_URL + meetingListUrl,
    );
    return MeetingListModel.fromJson(response);
  }

  Future<CreateMeetingModel> createMeetingApi({
    String? meetingName,
    String? description,
    String? location,
    String? meetingDate,
    int? durationMinutes,
    int? categoryId,
    List<int>? participantIds,
  }) async {
    final response = await api.post(
      BASE_URL + meetingCreateUrl,
      bodyPerm: {
        "meetingName": meetingName,
        "description": description,
        "location": location,
        "meetingDate": meetingDate,
        "durationMinutes": durationMinutes,
        "categoryId": categoryId,
        "participantIds": participantIds,
      },
    );
    return CreateMeetingModel.fromJson(response);
  }

  Future<MeetingRespondModel> respondToMeetingApi({
    int? meetingId,
    int? isAttending,
  }) async {
    final response = await api.post(
      BASE_URL + meetingRespondUrl,
      bodyPerm: {"meetingId": meetingId, "isAttending": isAttending},
    );
    return MeetingRespondModel.fromJson(response);
  }

  // Ticket APIs
  Future<GetTicketModel> getPendingTicketsApi(
    var startIndex,
    var pageSize,
    int? employeeId,
    String? searchText,
    int? status,
  ) async {
    final response = await api.get(
      query: {
        "startIndex": startIndex,
        "pageSize": pageSize,
        "employeeId": employeeId,
        // "SearchText": searchText,
        "status": status,
      },
      BASE_URL + pendingTicketsUrl,
    );
    return GetTicketModel.fromJson(response);
  }

  Future<GetTicketModel> getClosedTicketsApi(
    var startIndex,
    var pageSize,
    int? employeeId,
    String? searchText,
    int? status,
  ) async {
    final response = await api.get(
      query: {
        "startIndex": startIndex,
        "pageSize": pageSize,
        "employeeId": employeeId,
        // "SearchText": searchText,
        "status": status,
      },
      BASE_URL + closedTicketsUrl,
    );
    return GetTicketModel.fromJson(response);
  }

  Future<CreateTicketsModel> saveTicketApi({
    String? description,
    int? checkedBy,
    int? allocatedToId,
    String? remarks,
    int? isPredefinedTat,
    int? isLocationOnActions,
    int? isAlertNow,
    int? isDueDateEnabled,
    String? observers,
    int? status,
    int? createdBy,
    int? createdByEmployeeId,
    String? ip,
    String? dueDate,
  }) async {
    final response = await api.post(
      BASE_URL + saveTicketUrl,
      bodyPerm: {
        "description": description,
        "checkedBy": checkedBy,
        "allocatedToId": allocatedToId,
        "remarks": remarks,
        "isPredefinedTat": isPredefinedTat,
        "isLocationOnActions": isLocationOnActions,
        "isAlertNow": isAlertNow,
        "isDueDateEnabled": isDueDateEnabled,
        "observers": observers,
        "status": status,
        "createdBy": createdBy,
        "createdByEmployeeId": createdByEmployeeId,
        "ip": ip,
        "dueDate": dueDate,
      },
    );
    return CreateTicketsModel.fromJson(response);
  }

  // Work History APIs
  Future<WorkHistoryModel> getWorkHistoryMonthlyApi({
    int? employeeId,
    int? month,
    int? year,
  }) async {
    final response = await api.get(
      query: {"employeeId": employeeId, "month": month, "year": year},
      BASE_URL + workHistoryMonthlyUrl,
    );
    return WorkHistoryModel.fromJson(response);
  }

  // Create Expense
  Future<ActivityModel> saveExpenseApi({
    int? employeeId,
    String? description,
    String? expenseOn,
    String? remarks,
    String? expenseType,
    String? amount,
  }) async {
    final response = await api.post(
      BASE_URL + saveActivityUrl,
      bodyPerm: {
        "employeeId": 19,
        "description": description,
        "expenseOn": expenseOn,
        "expenseType": expenseType,
        "amount": amount,
        "remark": remarks,
      },
    );
    return ActivityModel.fromJson(response);
  }

  Future<EmployeeByMangerModel> getEmployeeByMangerApi(int? employeeId) async {
    final response = await api.get(
      query: {"employeeId": employeeId},
      BASE_URL + employeeByManagerUrl,
    );
    return EmployeeByMangerModel.fromJson(response);
  }*/
}
