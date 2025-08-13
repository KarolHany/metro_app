import 'dart:collection';

import 'package:metro_app/core/constants/map.dart';
import 'package:metro_app/features/home/data/models/node.dart';
import 'package:metro_app/features/home/data/models/pair.dart';
import 'package:metro_app/features/home/data/models/path_details.dart';

class Station {
  final String src;
  final String dest;
  final finalPath = <PathDetails>[];

  Station({required this.src, required this.dest});

  List<Pair<String, String>> travel(String src, String dest) {
    finalPath.clear();
    if (!stationsOfMetro.containsKey(src)) {
      print("Enter valid entery point");
      return [];
    }

    if (!stationsOfMetro.containsKey(dest)) {
      print("Enter valid end point");
      return [];
    }

    if (src == dest) {
      print("you are already in $src");
      return [];
    }

    final par = <String, Pair<String, String>>{};
    final queue = Queue<Node>();
    queue.add(Node(src));
    String destDir = "";

    while (queue.isNotEmpty) {
      final node = queue.removeFirst();

      if (node.station == dest) {
        destDir = node.dir;
        break;
      }

      for (final child in stationsOfMetro[node.station]!) {
        if (!par.containsKey(child.first)) {
          par[child.first] = Pair(node.station, node.dir);
          queue.add(Node(child.first, child.second));
        }
      }
    }

    if (destDir.isEmpty) {
      print("there is no path");
      return [];
    }

    List<Pair<String, String>> path = [];
    var current = Pair(dest, destDir);

    while (true) {
      path.add(current);
      if (current.first == src) break;
      current = par[current.first]!;
    }

    path = path.reversed.toList();

    for (var i = 0; i < path.length - 1; i++) {
      var st = i;
      var cnt = 1;
      while (i + 2 < path.length && path[i + 1].second == path[i + 2].second) {
        i++;
        cnt++;
      }
      finalPath.add(
        PathDetails(path[st].first, path[i + 1].first, path[i + 1].second, cnt),
      );
    }
    if (path.isNotEmpty)
      return path;
    else
      return [];
  }

  String discribe() {
    String s = '';
    for (final detail in finalPath) {
      s +=
          "move from ${detail.start} ${detail.stationsCount} stations to ${detail.end} in ${detail.dir} direction\n";
    }
    return s;
  }
}
