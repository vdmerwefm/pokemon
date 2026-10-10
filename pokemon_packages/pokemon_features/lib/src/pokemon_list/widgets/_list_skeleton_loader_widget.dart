part of '_barrel_pokemon_list.dart';

class ListSkeletonLoaderWidget extends StatelessWidget {
  const ListSkeletonLoaderWidget({
    super.key,
    this.count = 7,
    this.isEmptyRecord = false,
    this.leftPadding = 16,
    this.rightPadding = 16,
  });

  // TODO(vdmerwefm): Move this to shared widgets and rename with pokemon tag.

  final int count;
  final bool isEmptyRecord;
  final double leftPadding;
  final double rightPadding;

  @override
  Widget build(BuildContext context) {
    final skeletonList = ['Item1', 'Item2'];

    return Skeletonizer(
      enabled: true,
      effect: isEmptyRecord ? const SolidColorEffect(color: Color(0xFF3A3A3A),) :
      const PulseEffect(
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
            return SkeletonListTile(skeletonList: skeletonList);
          },
        ),
      ),
    );
  }
}
