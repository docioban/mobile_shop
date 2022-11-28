extension Price on double {
  String showPrice() {
    if (ceil() == this) {
      return toStringAsFixed(0);
    } else {
      return toStringAsFixed(2);
    }
  }
}
