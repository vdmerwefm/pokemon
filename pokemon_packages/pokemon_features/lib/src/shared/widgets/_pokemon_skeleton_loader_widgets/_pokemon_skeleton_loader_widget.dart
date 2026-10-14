part of '../_barrel_shared_widgets.dart';

class PokemonSkeletonLoaderWidget extends StatelessWidget {
  const PokemonSkeletonLoaderWidget({
    required this.isPokemonList,
    super.key,
    this.count = 7,
    this.isEmptyRecord = false,
    this.leftPadding = 16,
    this.rightPadding = 16,
  });

  final bool isPokemonList;
  final int count;
  final bool isEmptyRecord;
  final double leftPadding;
  final double rightPadding;

  @override
  Widget build(BuildContext context) {
    final skeletonList = ['Item1', 'Item2'];

    return Skeletonizer(
      enabled: true,
      effect: isEmptyRecord
          ? const SolidColorEffect(
              color: Color(0xFF3A3A3A),
            )
          : const PulseEffect(
              from: Color(0xFF1A1A1A),
              to: Color(0xFF3A3A3A),
              duration: Duration(seconds: 1),
            ),
      textBoneBorderRadius: const TextBoneBorderRadius(
        BorderRadiusGeometry.zero,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: count,
          itemBuilder: (context, index) {
            if(isPokemonList) {
              return PokemonSkeletonListTileWidget(skeletonList: skeletonList);
            } else {
              return PokemonMoveSkeletonListTileWidget(skeletonListType: skeletonList.first,);
            }
            
          },
        ),
      ),
    );
  }
}
