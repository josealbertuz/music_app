String secondsToMs(double seconds) {
  return '${(seconds / 60).truncate()}:${(seconds % 60).truncate().toString().padLeft(2, '0')}';
}

extension validators on String {
  bool isValidEmail() {
    return RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(this) &&
        this.length > 0 &&
        this.length <= 50;
  }

  bool isValidPassword() {
    return this.length >= 8 && this.length <= 25;
  }

  bool isValidUserName() {
    return this.length > 0 && this.length <= 25;
  }
}
