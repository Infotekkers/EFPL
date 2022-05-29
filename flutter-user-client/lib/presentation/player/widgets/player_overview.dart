import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:transparent_image/transparent_image.dart';

class PlayerOverview extends StatelessWidget {
  final dynamic state;
  static final String _baseUrl = "${dotenv.env["API"]}";

  const PlayerOverview({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle boldFacts = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue[100]);
    TextStyle primaryFacts = const TextStyle(color: Colors.white);
    TextStyle name = const TextStyle(fontSize: 24, color: Colors.white);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.blue[900],
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.player.name.getOrCrash(),
                style: name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.player.eplTeamId.getOrCrash(),
                style: primaryFacts,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Injury: " +
                    state.player.availability.injuryMessage.getOrCrash(),
                style: primaryFacts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
