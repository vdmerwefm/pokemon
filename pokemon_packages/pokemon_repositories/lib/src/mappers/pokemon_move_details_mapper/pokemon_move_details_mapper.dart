import 'package:poke_gql_client/poke_gql_client.dart' hide Pokemonmove;
import 'package:poke_gql_client/second_barrel.dart' show Pokemonmove;
import 'package:pokemon_models/pokemon_models.dart';

extension PokemonMoveDetailsMapper on GqlPokemonMoveDetailsDto {
  PokemonMoveDetailsModel toPokemonMoveDetailsModel() {
    final rawMoveDetails = data?.move?.firstOrNull;

    return PokemonMoveDetailsModel(
      id: rawMoveDetails?.id,
      name: rawMoveDetails?.name,
      type: rawMoveDetails?.type?.name,
      moveFlavorText: rawMoveDetails?.moveflavortexts?.firstOrNull?.flavorText,
      power: rawMoveDetails?.power,
      accuracy: rawMoveDetails?.accuracy,
      pp: rawMoveDetails?.pp,
      damageClass: rawMoveDetails?.movedamageclass?.name,
      damageClassDescription: rawMoveDetails
          ?.movedamageclass
          ?.movedamageclassdescriptions
          ?.firstOrNull
          ?.description,
      ailment: rawMoveDetails?.movemeta?.firstOrNull?.movemetaailment?.name,
      effect: rawMoveDetails
          ?.moveeffect
          ?.moveeffecteffecttexts
          ?.firstOrNull
          ?.shortEffect,
      machines: rawMoveDetails?.machines
          ?.map((e) => e.item?.name ?? '')
          .firstOrNull,
      pokemon: convertToPokemonListTileModel(rawMoveDetails?.pokemonmoves ?? []),
    );
  }

  List<PokemonListTileModel> convertToPokemonListTileModel(
    List<Pokemonmove> pokemonMove,
  ) {
    final pokemonList = <PokemonListTileModel>[];

    for (final pokemon in pokemonMove) {
      if(pokemon.pokemon!.id! <= 1025){
        pokemonList.add(
        PokemonListTileModel(
          id: pokemon.pokemon?.id ?? 0,
          name: pokemon.pokemon?.name ?? '',
          sprite: pokemon.pokemon?.pokemonsprites?.firstOrNull?.sprites ?? '',
          type:
              pokemon.pokemon?.pokemontypes
                  ?.map((e) => e.type?.name ?? '')
                  .toSet()
                  .toList() ??
              [],
          genus:
              pokemon
                  .pokemon
                  ?.pokemonGenus
                  ?.pokemonspecies
                  ?.firstOrNull
                  ?.genus ??
              '',
        ),
      );
      }
    }
    return pokemonList;
  }
}
