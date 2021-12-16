extension DisplayTime on DateTime {
  String toDisplayedString() {
    final date = DateTime(year, month, day);
    final time =
        "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));

    if (date == today) return ("Today, $time");
    if (date == yesterday) return ("Yesterday, $time");
    if (date == tomorrow) return ("Tomorrow, $time");
    return "$day ${month.toMonth()} $time";
  }
}

extension IntToMonth on int {
  String toMonth() {
    switch (this) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}

extension IntToWeekday on int {
  String toWeekday() {
    switch (this) {
      case 1:
        return 'MON';
      case 2:
        return 'TUE';
      case 3:
        return 'WED';
      case 4:
        return 'THU';
      case 5:
        return 'FRI';
      case 6:
        return 'SAT';
      case 7:
        return 'SUN';
      default:
        return '';
    }
  }
}
