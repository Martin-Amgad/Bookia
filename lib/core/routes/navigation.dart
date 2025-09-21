import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

Future pushTo(BuildContext context, String route) {
  return context.push(route);
}

pushWithReplacement(BuildContext context, String route) {
  return context.pushReplacement(route);
}

pushAndRemoveUntil(BuildContext context, String route) {
  return context.go(route);
}

pop(BuildContext context) {
  return context.pop();
}
