import 'dart:convert';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

const configJson =
    '{"name":"test","patron_date":"août+2010+Lac+St-Jean","patron_chaine":"Orlec+2/8",'
    '"patron_trame":"Orlec+doublé+2/8+bleu+moyen","patron_fils_chaine":"103","width":52,"height":12,'
    '"colors":["#3289c7","#325c44","#381ced","#eddf1c","#b52d6a","#f7f7f7","red","#75e6a6"],'
    '"commentaires":"largeur+tissée+1+6/8+pouce"}';
const motifJson =
    '[[{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#325c44"},{"couleur":"#381ced"},{"couleur":"#eddf1c"},{"couleur":"#325c44"},{"couleur":"#381ced"},{"couleur":"#eddf1c"},{"couleur":"#325c44"},{"couleur":"#381ced"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#325c44"},{"couleur":"#325c44"},{"couleur":"#325c44"},{"couleur":"#325c44"},{"couleur":"#f7f7f7"},{"couleur":"red"},{"couleur":"red"},{"couleur":"#f7f7f7"},{"couleur":"#325c44"},{"couleur":"#325c44"},{"couleur":"#325c44"},{"couleur":"#325c44"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#381ced"},{"couleur":"#325c44"},{"couleur":"#eddf1c"},{"couleur":"#381ced"},{"couleur":"#325c44"},{"couleur":"#eddf1c"},{"couleur":"#381ced"},{"couleur":"#325c44"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"}],[{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#eddf1c"},{"couleur":"#325c44"},{"couleur":"#381ced"},{"couleur":"#eddf1c"},{"couleur":"#325c44"},{"couleur":"#381ced"},{"couleur":"#eddf1c"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#75e6a6"},{"couleur":"#75e6a6"},{"couleur":"#75e6a6"},{"couleur":"#75e6a6"},{"couleur":"#f7f7f7"},{"couleur":"red"},{"couleur":"#f7f7f7"},{"couleur":"red"},{"couleur":"#f7f7f7"},{"couleur":"#75e6a6"},{"couleur":"#75e6a6"},{"couleur":"#75e6a6"},{"couleur":"#75e6a6"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#b52d6a"},{"couleur":"#eddf1c"},{"couleur":"#381ced"},{"couleur":"#325c44"},{"couleur":"#eddf1c"},{"couleur":"#381ced"},{"couleur":"#325c44"},{"couleur":"#eddf1c"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"},{"couleur":"#3289c7"}]]';

class Config {
  final String name;
  final String patronDdate;
  final String patronChaine;
  final String patronTrame;
  final String patronFilsChaine;
  final int width;
  final int height;
  final List<String> colors;
  final String commentaires;

  Config({
    required this.name,
    required this.patronDdate,
    required this.patronChaine,
    required this.patronTrame,
    required this.patronFilsChaine,
    required this.width,
    required this.height,
    required this.colors,
    required this.commentaires,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      name: json['name'],
      patronDdate: json['patron_date'],
      patronChaine: json['patron_chaine'],
      patronTrame: json['patron_trame'],
      patronFilsChaine: json['patron_fils_chaine'],
      width: json['width'],
      height: json['height'],
      colors: List<String>.from(json['colors']),
      commentaires: json['commentaires'],
    );
  }

  @override
  String toString() {
    return 'name: $name, patron_date: $patronDdate, patron_chaine: $patronChaine, patron_trame: $patronTrame, patron_fils_chaine: $patronFilsChaine, width: $width, height: $height, colors: $colors, commentaires: $commentaires';
  }
}

class Motif {
  final List<List<Map<String, String>>> motif;

  Motif({
    required this.motif,
  });

  factory Motif.fromJson(List<dynamic> json) {
    return Motif(
        motif: List<List<Map<String, String>>>.from(
      json.map(
        (e) => List<Map<String, String>>.from(
          e.map(
            (e) => Map<String, String>.from(e),
          ),
        ),
      ),
    ));
  }

  @override
  String toString() {
    return 'motif: $motif';
  }
}

class MotifProvider with ChangeNotifier {
  // Hardcoded for now
  Config config = Config.fromJson(json.decode(configJson));
  Motif motif = Motif.fromJson(json.decode(motifJson));

  changeMotif(int x, int y, Color color) {
    if (y < 0 ||
        y >= motif.motif.length ||
        x < 0 ||
        x >= motif.motif[0].length) {
      throw RangeError('Index out of range');
    }

    final couleurString = "#${(color.r * 255).toInt().toRadixString(16)}"
        "${(color.g * 255).toInt().toRadixString(16)}"
        "${(color.b * 255).toInt().toRadixString(16)}";

    // Update the color in the motif
    motif.motif[y][x]['couleur'] = couleurString;
    notifyListeners();
  }

  Map<String, String> get motifToMap {
    final map = <String, String>{};
    for (var y = 0; y < motif.motif.length; y++) {
      for (var x = 0; x < motif.motif[y].length; x++) {
        final couleur = motif.motif[y][x]['couleur'] ?? '';
        map['$x,$y'] = couleur;
      }
    }
    return map;
  }

  save() async {
    // Here you would typically save the motif to a database or file
    // For now, we just print it to the console
    print('Saving motif: ${motif.toString()}');

    final motifMap = {
      'name': config.name,
      'patron_date': config.patronDdate,
      'patron_chaine': config.patronChaine,
      'patron_trame': config.patronTrame,
      'patron_fils_chaine': config.patronFilsChaine,
      'width': config.width,
      'height': config.height,
      'colors': config.colors,
      'commentaires': config.commentaires,
      'motif': motifToMap,
    };

    // Save to Firestore
    try {
      await FirebaseFirestore.instance.collection('motifs').add(motifMap);
      print('Motif saved to Firestore');
    } catch (e) {
      print('Error saving motif to Firestore: $e');
    }
  }

  load() async {
    // Here you would typically load the motif from a database or file
    // For now, we just print a message
    print('Loading motif...');
    // You can implement loading logic here if needed
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('/motifs')
          .where('name', isEqualTo: "testdid")
          .get();
      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();
        config = Config(
            colors: List<String>.from(data['colors']),
            commentaires: data['commentaires'],
            height: data['height'],
            name: data['name'],
            patronChaine: data['patron_chaine'],
            patronDdate: data['patron_date'],
            patronFilsChaine: data['patron_fils_chaine'],
            patronTrame: data['patron_trame'],
            width: data['width']);

        print('Config loaded: $config');

        final motifData = data['motif'];
        // Convert the Map<String, String> to List<List<Map<String, String>>>
        final List<List<Map<String, String>>> motifList = [];
        for (var y = 0; y < 2; y++) {
          final List<Map<String, String>> row = [];
          for (var x = 0; x < config.width; x++) {
            final key = '$x,$y';
            final couleur =
                motifData[key] ?? '#FF0000'; // Default to red if not found
            row.add({'couleur': couleur});
          }
          motifList.add(row);
        }

        motif = Motif(motif: motifList);
        notifyListeners();
      }
    } catch (e) {
      print('Error loading motif: $e');
    }
  }

  MotifProvider() {
    //print("Motif created");
    //print(config);
    //print(motif);
  }
}
