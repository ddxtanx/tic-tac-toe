import 'dart:html';
import 'classes.dart';
main(){
  Board board = new Board();
  num x,y;
  bool isPlayer1 = true;
  var isWon = false;
  num completed = 0;
  String pathToImg;
  String player;
  for (Element e in querySelectorAll(".block")){
    e.onClick.listen((Event e){
      String id = e.target.id;
      num blockNum = int.parse(id[5])-1;
      x = (blockNum%3);
      y = (blockNum-x)/3;
      completed = switcher(board, x, y, isPlayer1);
      if(completed!=0&&isWon==false){
        pathToImg = (isPlayer1)?"../img/X.png":"../img/O.png";
        querySelector("#img"+id[5]).setAttribute('src', pathToImg);
        isPlayer1 = !isPlayer1;
        isWon = board.CheckWin();
        if(isWon!=false){
        switch(isWon[1]){
          case "Diag":
              handleDiagWin(isWon[2]);
              break;
          case "Vert":
              handleVertWin(isWon[2]);
              break;
          case "Hori":
              handleHoriWin(isWon[2]);
              break;
        }
        player = (isWon[0]==3)?"Player 1":"Player 2";
        querySelector("#messages").innerHtml = "Congrats "+player+" for winning!";
        }
      }
    });
  }
  querySelector("#restart").onClick.listen((Event e){
    board.WipeBoard();
    for(Element image in querySelectorAll(".images")){
      image.setAttribute('src', '');
      isPlayer1 = true;
      isWon = false;
      completed = 0;
    } 
    for(Element block in querySelectorAll(".block")){
      block.setAttribute('style', '');
    }
    querySelector("#messages").innerHtml = "";
  });
}
num switcher(Board b, num x, num y, bool isPlayer1){
  if(b.board[x][y]==0){
    if(isPlayer1){
      b.board[x][y]=3;
      return 3;
    } else{
      b.board[x][y]=5;
      return 5;
    }
  }
  return 0;
}
void handleDiagWin(num whichDiag){
  String classId = ".diag"+whichDiag.toString();
  for(Element diag in querySelectorAll(classId)){
    diag.setAttribute('style', "background-color: #0F0");
  }
}
void handleHoriWin(num row){
  String classId = ".hori"+(row).toString();
  for(Element diag in querySelectorAll(classId)){
    diag.setAttribute('style', "background-color: #0F0");
  }
}
void handleVertWin(num column){
String classId = ".vert"+(column).toString();
  for(Element diag in querySelectorAll(classId)){
    diag.setAttribute('style', "background-color: #0F0");
  }
}