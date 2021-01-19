String secondsToMs(double seconds) {
  return '${(seconds / 60).truncate()}:${(seconds % 60).truncate().toString().padLeft(2, '0')}';
}