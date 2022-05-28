import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:transparent_image/transparent_image.dart';

class PlayerOverview extends StatelessWidget {
  final dynamic state;
  static final String _baseUrl = "${dotenv.env["API"]}";

  const PlayerOverview({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle boldFacts = const TextStyle(
      fontWeight: FontWeight.bold,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.blue[500],
        elevation: 8.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.player.position.getOrCrash().toUpperCase(),
                  style: boldFacts,
                ),
                Transform.scale(
                  scale: 0.7,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: _baseUrl + state.player.image.getOrCrash(),
                  ),
                ),
                Text(
                  state.player.currentPrice.getOrCrash() + "M",
                  style: boldFacts,
                ),
              ],
            ),
            Text(state.player.name.getOrCrash()),
            Text(state.player.eplTeamId.getOrCrash()),
            Text(state.player.availability.injuryMessage.getOrCrash()),
          ],
        ),
      ),
    );
  }
}
