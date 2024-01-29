extension FormatImperial on num {
  String toImperial() {
if (isNaN) return 'Invalid Number';

    if (this < 1000) {
      return toString();
    } else if (this < 1000000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    } else {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    }
  }
}
