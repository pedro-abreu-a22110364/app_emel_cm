import 'package:app_emel_cm/pages/map_page.dart';
import 'package:app_emel_cm/pages/list_page.dart';
import 'package:app_emel_cm/pages/home_page.dart';
import 'package:app_emel_cm/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../model/parque.dart';
import '../model/tipo_parque.dart';

final pages = [
  //(title: 'Map Page', icon: Icons.details, widget: DetailPage(parque: null,)),
  (title: 'Map Page', icon: Icons.map, widget: MapPage()),
  (title: 'Home Page', icon: Icons.home, widget: HomePage()),
  (title: 'List Page', icon: Icons.list, widget: ListPage())
];