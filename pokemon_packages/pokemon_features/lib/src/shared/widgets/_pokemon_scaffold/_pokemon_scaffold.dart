part of '../_barrel_shared_widgets.dart';

class PokemonScaffold extends StatelessWidget {
  const PokemonScaffold({required this.body, super.key});

  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PokemonAppBar(showSearch: false,),
      body: body,
    );
  }
}
