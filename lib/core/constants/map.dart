import 'package:metro_app/features/home/data/models/pair.dart';

final stationsOfMetro = {
    // Line 1 (Blue: New El-Marg <-> Helwan)
    "New El-Marg": [Pair("El-Marg", "Helwan")],
    "El-Marg": [Pair("New El-Marg", "New El-Marg"), Pair("Ezbet El-Nakhl", "Helwan")],
    "Ezbet El-Nakhl": [Pair("El-Marg", "New El-Marg"), Pair("Ain Shams", "Helwan")],
    "Ain Shams": [Pair("Ezbet El-Nakhl", "New El-Marg"), Pair("El-Matareyya", "Helwan")],
    "El-Matareyya": [Pair("Ain Shams", "New El-Marg"), Pair("Helmeyet El-Zaitoun", "Helwan")],
    "Helmeyet El-Zaitoun": [Pair("El-Matareyya", "New El-Marg"), Pair("Hadayeq El-Zaitoun", "Helwan")],
    "Hadayeq El-Zaitoun": [Pair("Helmeyet El-Zaitoun", "New El-Marg"), Pair("Saray El-Qobba", "Helwan")],
    "Saray El-Qobba": [Pair("Hadayeq El-Zaitoun", "New El-Marg"), Pair("Hammamat El-Qobba", "Helwan")],
    "Hammamat El-Qobba": [Pair("Saray El-Qobba", "New El-Marg"), Pair("Kobri El-Qobba", "Helwan")],
    "Kobri El-Qobba": [Pair("Hammamat El-Qobba", "New El-Marg"), Pair("Manshiet El-Sadr", "Helwan")],
    "Manshiet El-Sadr": [Pair("Kobri El-Qobba", "New El-Marg"), Pair("El-Demerdash", "Helwan")],
    "El-Demerdash": [Pair("Manshiet El-Sadr", "New El-Marg"), Pair("Ghamra", "Helwan")],
    "Ghamra": [Pair("El-Demerdash", "New El-Marg"), Pair("Al-Shohadaa", "Helwan")],
    "Orabi": [Pair("Al-Shohadaa", "New El-Marg"), Pair("Nasser", "Helwan")],
    "Saad Zaghloul": [Pair("Sadat", "New El-Marg"), Pair("Al-Sayeda Zeinab", "Helwan")],
    "Al-Sayeda Zeinab": [Pair("Saad Zaghloul", "New El-Marg"), Pair("El-Malek El-Saleh", "Helwan")],
    "El-Malek El-Saleh": [Pair("Al-Sayeda Zeinab", "New El-Marg"), Pair("Mar Girgis", "Helwan")],
    "Mar Girgis": [Pair("El-Malek El-Saleh", "New El-Marg"), Pair("El-Zahraa", "Helwan")],
    "El-Zahraa": [Pair("Mar Girgis", "New El-Marg"), Pair("Dar El-Salam", "Helwan")],
    "Dar El-Salam": [Pair("El-Zahraa", "New El-Marg"), Pair("Hadayek El-Maadi", "Helwan")],
    "Hadayek El-Maadi": [Pair("Dar El-Salam", "New El-Marg"), Pair("Maadi", "Helwan")],
    "Maadi": [Pair("Hadayek El-Maadi", "New El-Marg"), Pair("Sakanat El-Maadi", "Helwan")],
    "Sakanat El-Maadi": [Pair("Maadi", "New El-Marg"), Pair("Tora El-Balad", "Helwan")],
    "Tora El-Balad": [Pair("Sakanat El-Maadi", "New El-Marg"), Pair("Kozzika", "Helwan")],
    "Kozzika": [Pair("Tora El-Balad", "New El-Marg"), Pair("Tora El-Asmant", "Helwan")],
    "Tora El-Asmant": [Pair("Kozzika", "New El-Marg"), Pair("El-Maasara", "Helwan")],
    "El-Maasara": [Pair("Tora El-Asmant", "New El-Marg"), Pair("Hadayek Helwan", "Helwan")],
    "Hadayek Helwan": [Pair("El-Maasara", "New El-Marg"), Pair("Wadi Hof", "Helwan")],
    "Wadi Hof": [Pair("Hadayek Helwan", "New El-Marg"), Pair("Helwan University", "Helwan")],
    "Helwan University": [Pair("Wadi Hof", "New El-Marg"), Pair("Ain Helwan", "Helwan")],
    "Ain Helwan": [Pair("Helwan University", "New El-Marg"), Pair("Helwan", "Helwan")],
    "Helwan": [Pair("Ain Helwan", "New El-Marg")],

    // Line 2 (Red: Shubra El-Kheima <-> El-Mounib)
    "Shubra El-Kheima": [Pair("Kolleyyet El-Zeraa", "El-Mounib")],
    "Kolleyyet El-Zeraa": [Pair("Shubra El-Kheima", "Shubra El-Kheima"), Pair("El-Mezallat", "El-Mounib")],
    "El-Mezallat": [Pair("Kolleyyet El-Zeraa", "Shubra El-Kheima"), Pair("El-Khalafawy", "El-Mounib")],
    "El-Khalafawy": [Pair("El-Mezallat", "Shubra El-Kheima"), Pair("St. Teresa", "El-Mounib")],
    "St. Teresa": [Pair("El-Khalafawy", "Shubra El-Kheima"), Pair("Rod El-Farag", "El-Mounib")],
    "Rod El-Farag": [Pair("St. Teresa", "Shubra El-Kheima"), Pair("Massara", "El-Mounib")],
    "Massara": [Pair("Rod El-Farag", "Shubra El-Kheima"), Pair("Al-Shohadaa", "El-Mounib")],
    "Mohamed Naguib": [Pair("Ataba", "Shubra El-Kheima"), Pair("Sadat", "El-Mounib")],
    "Opera": [Pair("Sadat", "Shubra El-Kheima"), Pair("Dokki", "El-Mounib")],
    "Dokki": [Pair("Opera", "Shubra El-Kheima"), Pair("Bohooth", "El-Mounib")],
    "Bohooth": [Pair("Dokki", "Shubra El-Kheima"), Pair("Cairo University", "El-Mounib")],
    "Faisal": [Pair("Cairo University", "Shubra El-Kheima"), Pair("Giza", "El-Mounib")],
    "Giza": [Pair("Faisal", "Shubra El-Kheima"), Pair("Omm El-Misryeen", "El-Mounib")],
    "Omm El-Misryeen": [Pair("Giza", "Shubra El-Kheima"), Pair("Sakiat Mekki", "El-Mounib")],
    "Sakiat Mekki": [Pair("Omm El-Misryeen", "Shubra El-Kheima"), Pair("El-Mounib", "El-Mounib")],
    "El-Mounib": [Pair("Sakiat Mekki", "Shubra El-Kheima")],

    // Line 3 (Green: Adly Mansour <-> Rod El Farag Corridor / Cairo University)
    "Adly Mansour": [Pair("Haykestep", "Cairo University")],
    "Haykestep": [Pair("Adly Mansour", "Adly Mansour"), Pair("Omar Ibn El Khattab", "Cairo University")],
    "Omar Ibn El Khattab": [Pair("Haykestep", "Adly Mansour"), Pair("Qubaa", "Cairo University")],
    "Qubaa": [Pair("Omar Ibn El Khattab", "Adly Mansour"), Pair("Hesham Barakat", "Cairo University")],
    "Hesham Barakat": [Pair("Qubaa", "Adly Mansour"), Pair("El Nozha", "Cairo University")],
    "El Nozha": [Pair("Hesham Barakat", "Adly Mansour"), Pair("Nadi El Shams", "Cairo University")],
    "Nadi El Shams": [Pair("El Nozha", "Adly Mansour"), Pair("Alf Maskan", "Cairo University")],
    "Alf Maskan": [Pair("Nadi El Shams", "Adly Mansour"), Pair("Heliopolis", "Cairo University")],
    "Heliopolis": [Pair("Alf Maskan", "Adly Mansour"), Pair("Haroun", "Cairo University")],
    "Haroun": [Pair("Heliopolis", "Adly Mansour"), Pair("Al-Ahram", "Cairo University")],
    "Al-Ahram": [Pair("Haroun", "Adly Mansour"), Pair("Koleyet El-Banat", "Cairo University")],
    "Koleyet El-Banat": [Pair("Al-Ahram", "Adly Mansour"), Pair("Cairo Stadium", "Cairo University")],
    "Cairo Stadium": [Pair("Koleyet El-Banat", "Adly Mansour"), Pair("Cairo Fair", "Cairo University")],
    "Cairo Fair": [Pair("Cairo Stadium", "Adly Mansour"), Pair("Abbassiya", "Cairo University")],
    "Abbassiya": [Pair("Cairo Fair", "Adly Mansour"), Pair("Abdou Pasha", "Cairo University")],
    "Abdou Pasha": [Pair("Abbassiya", "Adly Mansour"), Pair("El-Geish", "Cairo University")],
    "El-Geish": [Pair("Abdou Pasha", "Adly Mansour"), Pair("Bab El-Shaaria", "Cairo University")],
    "Bab El-Shaaria": [Pair("El-Geish", "Adly Mansour"), Pair("Ataba", "Cairo University")],
    "Maspero": [Pair("Nasser", "Adly Mansour"), Pair("Safaa Hijazy", "Cairo University")],
    "Safaa Hijazy": [Pair("Maspero", "Adly Mansour"), Pair("Kit-Kat", "Cairo University")],

    // Line 3 - North Branch
    "Sudan": [Pair("Kit-Kat", "Adly Mansour"), Pair("Imbaba", "Rod El Farag Corridor")],
    "Imbaba": [Pair("Sudan", "Adly Mansour"), Pair("El-Bohy", "Rod El Farag Corridor")],
    "El-Bohy": [Pair("Imbaba", "Adly Mansour"), Pair("El-Qawmia", "Rod El Farag Corridor")],
    "El-Qawmia": [Pair("El-Bohy", "Adly Mansour"), Pair("Ring Road", "Rod El Farag Corridor")],
    "Ring Road": [Pair("El-Qawmia", "Adly Mansour"), Pair("Rod El Farag Corridor", "Rod El Farag Corridor")],
    "Rod El Farag Corridor": [Pair("Ring Road", "Adly Mansour")],

    // Line 3 - South Branch
    "Tawfikia": [Pair("Kit-Kat", "Adly Mansour"), Pair("Wadi El Nile", "Cairo University")],
    "Wadi El Nile": [Pair("Tawfikia", "Adly Mansour"), Pair("Gamet El Dowel", "Cairo University")],
    "Gamet El Dowel": [Pair("Wadi El Nile", "Adly Mansour"), Pair("Boulak El Dakrour", "Cairo University")],
    "Boulak El Dakrour": [Pair("Gamet El Dowel", "Adly Mansour"), Pair("Cairo University", "Cairo University")],

    // Transfer Stations
    "Al-Shohadaa": [
      Pair("Ghamra", "New El-Marg"),
      Pair("Orabi", "Helwan"),
      Pair("Massara", "Shubra El-Kheima"),
      Pair("Ataba", "El-Mounib")
    ],
    "Nasser": [
      Pair("Orabi", "New El-Marg"),
      Pair("Sadat", "Helwan"),
      Pair("Ataba", "Adly Mansour"),
      Pair("Maspero", "Cairo University")
    ],
    "Sadat": [
      Pair("Nasser", "New El-Marg"),
      Pair("Saad Zaghloul", "Helwan"),
      Pair("Mohamed Naguib", "Shubra El-Kheima"),
      Pair("Opera", "El-Mounib")
    ],
    "Ataba": [
      Pair("Al-Shohadaa", "Shubra El-Kheima"),
      Pair("Mohamed Naguib", "El-Mounib"),
      Pair("Bab El-Shaaria", "Adly Mansour"),
      Pair("Nasser", "Cairo University")
    ],
    "Kit-Kat": [
      Pair("Safaa Hijazy", "Adly Mansour"),
      Pair("Sudan", "Rod El Farag Corridor"),
      Pair("Tawfikia", "Cairo University")
    ],
    "Cairo University": [
      Pair("Bohooth", "Shubra El-Kheima"),
      Pair("Faisal", "El-Mounib"),
      Pair("Boulak El Dakrour", "Adly Mansour")
    ]
};