import 'dart:async';

/// A small reusable debounce helper. Each call to [run] cancels any pending
/// invocation and schedules a new one after [delay]. Used independently by
/// autosave and by live-preview regeneration so a slow preview render can
/// never delay saving to disk.
class Debouncer {
  Debouncer(this.delay);

  final Duration delay;
  Timer? _timer;

  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
