import 'package:flutter/material.dart';

class FailWidget extends StatelessWidget {
  FailWidget({super.key,required this.errorMessage,required this.tryAgain});

 final String errorMessage;
 final Function() tryAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(errorMessage),
      ),
        OutlinedButton(
            onPressed: tryAgain,
          child: const Text("Try Again!"),
        )
      ],
    );
  }
}
