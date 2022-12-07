import 'Ecurie.dart';

class Pilote{
  final int id;
  final String nom;
  final String prenom;
  final String numero;
  final Ecurie ecurie;
  final int points;

  const Pilote({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.numero,
    required this.ecurie,
    required this.points,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'numero': numero,
      'ecurie': ecurie,
      'points': points,
    };
  }

  @override
  String toString() {
    return 'Pilote{id: $id, nom: $nom, prenom: $prenom, numero: $numero, ecurie: $ecurie, points: $points}';
  }
}