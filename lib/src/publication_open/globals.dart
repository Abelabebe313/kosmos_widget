import 'package:flutter/material.dart';

ValueNotifier<bool> notifier = ValueNotifier(false);

void triggerNotifier() {
  notifier.value = !notifier.value;
}

ValueNotifier<bool> refreshNotifier = ValueNotifier(false);

void triggerNotifierRefresh() {
  refreshNotifier.value = !refreshNotifier.value;
}

ValueNotifier<bool> commentPaginationNotifier = ValueNotifier(false);

void triggerCommentPaginationNotifier() {
  commentPaginationNotifier.value = !commentPaginationNotifier.value;
}
