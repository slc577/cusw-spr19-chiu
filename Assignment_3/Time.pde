class Time {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final float second;

  Time(String s) {
    this.year = Integer.parseInt(s.substring(0,4));
    this.month = Integer.parseInt(s.substring(5,7));
    this.day = Integer.parseInt(s.substring(8,10));
    this.hour = Integer.parseInt(s.substring(11,13));
    this.minute = Integer.parseInt(s.substring(14,16));
    this.second = Float.parseFloat(s.substring(17,24));
  }
}
