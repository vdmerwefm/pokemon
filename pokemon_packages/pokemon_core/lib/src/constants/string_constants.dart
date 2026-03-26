///Failures
// ignore_for_file: lines_longer_than_80_chars
library;

const String unknownFailureMessage = 'An unknown error occurred.';
const String httpFailureMessage =
    'An error occurred while making the HTTP request.';
const String audioFailureMessage =
    'Failed to collect audio from package or url';

///Deprications:
const String pokeApiRawListDeprecationMessage =
    'fetchPokemonRawList from PokeApiClient is depricated, it does not provide the needed data to correctly display all pokemon list info, please use fetchGqlPokemonList instead';
