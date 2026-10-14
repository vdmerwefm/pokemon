part of '../_barrel_shared_widgets.dart';

class PokemonScaffoldWidget extends StatelessWidget {
  const PokemonScaffoldWidget({required this.body, super.key});

  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PokemonAppBarWidget(showSearch: false,),
      body: body,
    );
  }
}
