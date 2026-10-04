import 'package:flutter/material.dart';
import 'package:pokemon_ui_kit/pokemon_ui_kit.dart';

class SkeletonListTile extends StatelessWidget {
  const SkeletonListTile({required this.skeletonList, super.key});

  final List<String> skeletonList;
  
  @override
  Widget build(BuildContext context) {
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
  }
}
