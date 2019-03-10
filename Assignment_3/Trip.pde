class Trip {
  private int userAge;
  private int userGender;

  Trip(int userAge, int userGender) {
    this.userAge = userAge;
    this.userGender = userGender;
  }

  int getUserAge() {
    return this.userAge;
  }

  int getUserGender() {
    return this.userGender;
  }
}
