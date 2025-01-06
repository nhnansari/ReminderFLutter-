// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:intl/intl.dart';

extension Validations on String {
  String? validEmail() {
    if (trim().isNotEmpty) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern.toString());
      if (!contains("@") && !regExp.hasMatch(trim())) {
        return "Invalid Email";
      }
    } else {
      return "E-mail is Required";
    }
    return null;
  }

  String? validPhoneNUmber() {
    if (trim().isNotEmpty) {
      Pattern pattern =
          r'^(?:\+?\d{1,3}[\s-]?)?(?:\(\d{1,4}\)[\s-]?)?\d{1,15}$';
      RegExp regExp = RegExp(pattern.toString());
      if (!regExp.hasMatch(trim())) {
        return "Invalid Phone Number";
      }
    } else {
      return "Phone Number is Required";
    }
    return null;
  }

  String? validPassword() {
    if (trim().isNotEmpty) {
      if (trim().length < 6) {
        return "Password is to short (minimum length is 6)";
      } else if (!RegExp(r'[A-Z]').hasMatch(trim()) ||
          !RegExp(r'[0-9]').hasMatch(trim())) {
        return 'Password must contain:\n- at least one uppercase letter\n- at least one lowercase letter\n- at least one numeric character';
      }
    } else {
      return "Password Required";
    }
    return null;
  }
}

extension StringExtensions on String? {
  bool toCheckBoolStringWithNullSafety() {
    if (this != null && this!.isNotEmpty && this != "N/A") {
      return true;
    }

    return false;
  }

  String toDateStringMMYYWithNullSafety() {
    if (this != null) {
      DateTime dateTime = DateTime.parse(this!);
      return DateFormat.yMMMM().format(dateTime);
    }

    return "N/A";
  }

  String toMMddyyyyAMPM() {
    if (this != null && this!.isNotEmpty) {
      final DateFormat _formatter = DateFormat('MM/dd/yyyy hh:mm a');
      return _formatter.format(DateTime.parse(this!));
    }
    return "N/A";
  }

  String? toDateStringWithNullSafety() {
    if (this != null) {
      DateTime dateTime = DateTime.parse(this!);
      return DateFormat.yMd().format(dateTime);
    }
    return "N/A";
  }

  DateTime? toDate() {
    if (this != null) {
      final DateFormat formatter = DateFormat("yyyy-MM-dd");
      return formatter.parse(formatter.format(DateTime.parse(this!)));
    }
    return DateTime(0);
  }

  DateTime? toDateFromString2() {
    if (this != null) {
      DateTime? effectiveFrom = DateTime.parse(this!);
      return effectiveFrom;
    }
    return DateTime(0);
  }

  double? toDoubleWithoutCommas() {
    if (this != null) {
      return double.parse(this!.replaceAll(',', ''));
    }
    return null;
  }

  String to24Hour() {
    if (this != null && this!.isNotEmpty) {
      return DateFormat('Hms')
          .format(DateFormat('hh:mm aaa', 'en_US').parse(this!));
    }
    return "N/A";
  }

  DateTime? toTimeFromString() {
    if (this != null) {
      var format = DateFormat('hh:mm aaa');
      return format.parse(this!);
    }
    return null;
  }

  String toNullOrEmpty({bool isNotApplicable = false}) {
    if (this != null && this!.isNotEmpty) {
      return this!;
    } else {
      return isNotApplicable ? "N/A" : "";
    }
  }

  String? checkNullOrEmpty() {
    try {
      if (this!.trim().isEmpty || this == null) {
        return "N/A";
      }
      return this;
    } catch (e) {
      return "N/A";
    }
  }

  String? toValidFormatDateTime() {
    final date = this!.split("T");
    if (date.isEmpty) {
      return null;
    }
    return date.first;
  }

  String? toDateTimeForRequest() {
    final arr = this!.split(" ");
    if (arr.isEmpty) {
      return null;
    }
    return "${arr.first}T${arr.last}";
  }

  String? toCheckNullEmpty() {
    if (this!.trim().isNotEmpty) {
      return null;
    }
    return "Fill The Empty Field";
  }

  String? cnicValidation() {
    if (this!.isEmpty) {
      return 'CNIC Required';
    } else if (this!.length != 15) {
      return 'Invalid length';
    }
    return null;
  }

  String? fileExtension() {
    final type = this!.split("file_picker/").last.split(".").last;
    if (type.contains('svg')) {
      return "svg+xml";
    } else {
      return type;
    }
  }

  String? toCheckAmountNullEmpty() {
    if (this!.trim().isNotEmpty) {
      return null;
    } else if (int.parse(this!.replaceAll(",", "")) <= 0) {
      return "Deduction Amount cannot be equal to zero!";
    }
    return "Fill The Empty Field";
  }

  String toAmPm() {
    var date = DateFormat('Hms', 'en_US').parse(this!);
    return DateFormat('hh:mm aaa').format(date);
  }
}
