extension UrlValidate on String {
  bool validateUrl() {
    return Uri.tryParse(this)?.hasAbsolutePath ?? false;
  }
}