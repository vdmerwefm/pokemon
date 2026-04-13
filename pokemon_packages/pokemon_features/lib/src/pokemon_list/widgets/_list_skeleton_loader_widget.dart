import 'package:pokemon_features/src/pokemon_list/widgets/_barrel_pokemon_list.dart';

class ListSkeletonLoaderWidget extends StatelessWidget {
  const ListSkeletonLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final skeletonList = ['Item1', 'Item2'];

    return Skeletonizer(
      enabled: true,
      effect: const PulseEffect(
        from: Color(0xFF1A1A1A),
        to: Color(0xFF3A3A3A),
        duration: Duration(seconds: 1),
      ),
      textBoneBorderRadius: const TextBoneBorderRadius(
        BorderRadiusGeometry.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                color: const Color(0xFF1A1A1A),
                width: MediaQuery.sizeOf(context).width,
                height: 96,
                child: Row(
                  children: [
                    Container(
                      height: 96,
                      width: 100,
                      color: const Color(0xFF3A3A3A),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Venusaur',
                              style: pokemonInfoStyle(
                                const Color(0xFFE5E5E5),
                              ),
                            ),
                            Text(
                              '#003',
                              style: pokemonInfoStyle(
                                const Color(0xFFE5E5E5),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Seed Pokemon',
                              style: pokemonInfoStyle(
                                const Color(0xFFE5E5E5),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 8,
                                children: [
                                  Column(
                                    spacing: 8,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: skeletonList.map((type) {
                                      return Container(
                                        padding: const EdgeInsets.only(top: 1),
                                        height: 24,
                                        child: Center(
                                          child: Text(
                                            type.toUpperCase(),
                                            style: pokemonBadgeTextStyle(
                                              const Color(0xFFE5E5E5),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  Column(
                                    spacing: 8,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: skeletonList.map((type) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Container(
                                          color: const Color(0xFF3A3A3A),
                                          height: 24,
                                          width: 24,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
