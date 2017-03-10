class Board{
  List board = [[0,0,0],[0,0,0],[0,0,0]];
  //Player 1 has value of 3
  //Player 2 has value of 5
  Switch(num x, num y, bool isPlayer1){
    num playerID = (isPlayer1==true)?3:5;
    if(this.board[x][y]==0){
      this.board[x][y] = playerID;
      return true;
    } else{
      return false;
    }
  }
  DiagWin(){
    num sum1 = 0;
    for(num x = 0; x<3; x++){
      sum1+=this.board[x][x];
    }
    num sum2 = 0;
    for(num x = 0; x<3; x++){
      sum2+=this.board[x][2-x];
    }
    if(sum1==9||sum2==9){
      return (sum1==9)?[3,"Diag",1]:[3,"Diag",2];
    } else if(sum1==15||sum2==15){
      return (sum1==9)?[5,"Diag",1]:[5,"Diag",2];
    } else{
      return false;
    }
  }
  HoriVertWin(){
    List sums = [0,0,0];
    for(num y = 0; y<3; y++){
      for(num x = 0; x<3; x++){
        sums[y] += this.board[y][x];
      }
    }
    num win;
    for(num x = 0; x<3; x++){
      if(sums[x]==9||sums[x]==15){
        win = sums[x];
        return [win/3, "Vert", x+1];
      }
    }
    sums = [0,0,0];
    for(num y = 0; y<3; y++){
      for(num x = 0; x<3; x++){
        sums[y] += this.board[x][y];
      }
    }
    for(num x = 0; x<3; x++){
      if(sums[x]==9||sums[x]==15){
        win = sums[x];
        return [win/3, "Hori", x+1];
      }
    }
    return false;
  }
  CheckWin(){
      if(DiagWin()!=false){
        return DiagWin();
      } else if(HoriVertWin()!=false){
        return HoriVertWin();
      } else{
        return false;
      }
  }
  WipeBoard(){
    this.board = [[0,0,0],[0,0,0],[0,0,0]];
  }
}