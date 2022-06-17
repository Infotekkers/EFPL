import 'package:flutter/material.dart';

class FixtureEventDisplay extends StatelessWidget {
  final Map commonEvents;
  const FixtureEventDisplay({Key? key, required this.commonEvents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // Home Team
        ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 0,
        minWidth: MediaQuery.of(context).size.width * 0.5,
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Assists
              commonEvents['assists'].length == 0
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 0,
                          minWidth: MediaQuery.of(context).size.width * 0.5,
                        ),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(),
                          child: ListView.builder(
                            itemCount: commonEvents['assists'].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              List<int> _items = List.generate(
                                commonEvents['assists'][index]['count'],
                                (i) => i,
                              );
                              return Container(
                                height: 25,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: Wrap(
                                  children: [
                                    Text(
                                      commonEvents['assists'][index]
                                              ['playerName']
                                          .toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: _items
                                          .map(
                                            (i) => Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  4, 3, 0, 0),
                                              color: Colors.black,
                                              child: const Text(
                                                "A",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

              // penalitiesMissed
              commonEvents['penalitiesMissed'].length == 0
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 0,
                          // maxHeight: 100,
                          minWidth: MediaQuery.of(context).size.width * 0.5,
                        ),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(),
                          child: ListView.builder(
                            itemCount: commonEvents['penalitiesMissed'].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              List<int> _items = List.generate(
                                commonEvents['penalitiesMissed'][index]
                                    ['count'],
                                (i) => i,
                              );
                              return Container(
                                height: 25,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      commonEvents['penalitiesMissed'][index]
                                              ['playerName']
                                          .toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: _items
                                          .map(
                                            (i) => Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  4, 3, 0, 0),
                                              color: Colors.black,
                                              child: const Text(
                                                "X",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  backgroundColor: Colors.red,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

              // Yellow Cards
              commonEvents['yellows'].length == 0
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 0,
                          // maxHeight: 100,
                          minWidth: MediaQuery.of(context).size.width * 0.5,
                        ),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(),
                          child: ListView.builder(
                            itemCount: commonEvents['yellows'].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              List<int> _items = List.generate(
                                commonEvents['yellows'][index]['count'],
                                (i) => i,
                              );
                              return Container(
                                height: 25,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      commonEvents['yellows'][index]
                                              ['playerName']
                                          .toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),

                                    // RED Card from 2 yellows
                                    commonEvents['yellows'][index]['count'] > 1
                                        ? Container(
                                            height: 20,
                                            width: 12,
                                            color: Colors.red,
                                          )
                                        : Container(),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: _items
                                          .map(
                                            (i) => Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  2, 3, 0, 0),
                                              color: Colors.black,
                                              child: Container(
                                                height: 20,
                                                width: 12,
                                                color: Colors.amber,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

              // Red Cards
              commonEvents['reds'].length == 0
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 0,
                          // maxHeight: 100,
                          minWidth: MediaQuery.of(context).size.width * 0.5,
                        ),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(),
                          child: ListView.builder(
                            itemCount: commonEvents['reds'].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 25,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      commonEvents['reds'][index]['playerName']
                                          .toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 12,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
