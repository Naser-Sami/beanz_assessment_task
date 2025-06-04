import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget Function(BuildContext, GoRouterState)? errorBuilder = (context, state) {
  if (state.uri.path.contains('/link')) {}

  return ErrorPage(state.error.toString());
};

class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(error)));
  }
}
