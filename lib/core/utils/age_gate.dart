/// Neutral age gate for COPPA compliance.
/// No PII stored — only whether user is under 13.
class AgeGate {
  AgeGate._();

  static bool isUnder13(DateTime? birthDate) {
    if (birthDate == null) return false;
    final now = DateTime.now();
    final age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      return age - 1 < 13;
    }
    return age < 13;
  }
}
