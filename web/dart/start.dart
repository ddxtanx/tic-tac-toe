import 'dart:html';
import 'package:dquery/dquery.dart';
main(){
  $("#advance").on('click', (QueryEvent e){
   window.location.href = '/html/game.html';
  });
}