import 'package:flutter/material.dart';

class BouncingBallLoadingIndicator extends StatelessWidget {
  const BouncingBallLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.2,
      child: Center(
        child: Image.asset("assets/images/efpl_ball_mobile.gif"),
      ),
    );
  }
}
