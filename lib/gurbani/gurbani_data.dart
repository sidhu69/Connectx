import 'bani_japji_sahib.dart';
import 'bani_japji_sahib_meaning.dart';
import 'bani_jaap_sahib.dart';
import 'bani_jaap_sahib_meaning.dart';
import 'bani_anand_sahib.dart';
import 'bani_anand_sahib_meaning.dart';
// Add more bani imports here as you create them

/// Central Gurbani registry
/// Key  -> Gurbani title
/// Value -> Full Gurbani text
final Map<String, String> gurbaniText = {
  japjiSahibTitle: japjiSahibText,
  jaapSahibTitle: jaapSahibText,
  anandSahibTitle: anandSahibText,
};
