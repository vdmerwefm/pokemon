import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

extension PokemonMovesListMapper on GqlPokemonMovesListDto {
  List<PokemonMovesListModel> toPokemonMovesListModel() {
    return data?.move?.map((move) {
          return PokemonMovesListModel(
            name: move.name,
            type: move.type?.name,
            powerPoints: move.power,
            accuracy: move.accuracy,
            damageClass: move.movedamageclass?.name,
          );
        }).toList() ??
        [];
  }
}
