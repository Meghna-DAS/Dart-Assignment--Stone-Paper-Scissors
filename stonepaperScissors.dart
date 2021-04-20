import 'dart:io';
import 'dart:math';

void main(){
  print("*******************************************");
  print("Welcome to the game -Stone, Paper, Scissors");
  print("*******************************************");
  print("Following are rules of the game:");
  print("Stone VS Scissors- Stone WINS");
  print("Scissors VS Paper- Scissors WINS") ; 
  print("Paper VS Stone- Paper WINS");
  print("If both select same then its a tie");
  print("*******************************************");

  final rand = Random();

  // Rules of the game
  Map<String, String> rules = {
      "stone": "scissors",
      "scissors": "paper",
      "paper": "stone"
  };

  //Options for computer to choose
  List<String> choices = ["stone", "paper", "scissors"];
  int playerOption= 1;
  
  while(playerOption==1){
    // Initial score
    int player = 0;
    int computer = 0;

    //Exception Handling
    try{
      
      stdout.write("\nPlease type number of rounds you want: ");
      int rounds_to_play = int.parse(stdin.readLineSync());
      
      print("*******************************************");

      int rounds_played=0;
      
      // Actual game
      while (rounds_played<rounds_to_play){

        String computerChoice = choices[rand.nextInt(choices.length)];
        stdout.write("\nPlease select Stone, Paper or Scissors: ");
        String playerChoice = stdin.readLineSync().toLowerCase();

        if (!choices.contains(playerChoice)){
          print("Incorrect choice");
          continue;
        }

        else if (computerChoice == playerChoice){
          print("It is a Tie!");
        }

        else if (rules[computerChoice] == playerChoice){
          print("Computer wins: $computerChoice vs $playerChoice");
          computer += 1;
        }

        else if (rules[playerChoice] == computerChoice){
          print("Player wins: $playerChoice vs $computerChoice");
          player += 1;
        }

        else{
          print("Debug Plane: " + playerChoice + " : " + computerChoice);
        }

        rounds_played++;
      }
        
      print("\nPlayer Score: $player Computer Score: $computer");
      print("*******************************************");
    
      if(player>computer){
        print("Player wins the round");
        print("*******************************************");
      }

      else if(computer>player){
        print("Computer wins the round");
        print("*******************************************");
      }

      else{
        print("Round Tied");
      }
      print("Do you want to play again? 1=Yes 0=No: ");
      playerOption = int.parse(stdin.readLineSync());
    }

    on FormatException{
      print("*******************************************");
      print("Error!! Can't proceed.");
      break;
    }
  }

  print("Bye Bye!");
  print("*******************************************");
}
