part of '../presentation/page/pokemon_list_page.dart';

class ListSkeletonLoader extends StatelessWidget {
  const ListSkeletonLoader({required this.pokemonListIsEmpty, super.key});

  final bool pokemonListIsEmpty;

  @override
  Widget build(BuildContext context) {
    final skeletonList = ['listItem1', 'listItem2'];

    return Skeletonizer(
      enabled: true,
      effect: const PulseEffect(
        from: Color(0xFF1A1A1A),
        to: Color(0xFF5F504D),
        duration: Duration(milliseconds: 500),
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
                      color: const Color(0xFF5F504D),
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
                                Colors.white,
                              ),
                            ),
                            Text(
                              '#003',
                              style: pokemonInfoStyle(
                                Colors.white.withValues(alpha: 50),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Seed Pokemon',
                              style: pokemonInfoStyle(
                                Colors.white.withValues(alpha: 75),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
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
                                            Colors.white,
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
                                    return Container(
                                      color: const Color(0xFF5F504D),
                                      height: 24,
                                      width: 24,
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 24,
                          width: 36,
                          color: const Color(0xFF5F504D),
                        ),
                      ],
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
