"Represents a facade for playing the Hangman game."
see(`class HangmanGame`)
by("Kris Thomsen")
class HangmanGameRunner() {
	
	"Creates a new [[HangmanGame]] and starts it."
	shared void start() {
		value game = HangmanGame();
		
		while (true) {
			print("Guess: ");
			value input = process.readLine();
			if (exists input) {
				if (input == "quit") {
					break;
				}
				
				if (exists guess = input.first) {
					if (game.makeGuess(guess)) {
						print("Yay!");
					} else {
						print("Nay!");
					}
				}
			}
			
			if (game.printStatus()) {
				print("Done!");
				break;
			}
			
			if (game.wrongGuessLimitReached()) {
				print("Man got hanged!");
				break;
			}
		}
		
		askForNewGame();
	}
	
	void askForNewGame() {
		print("New Game? ");
		value answer = process.readLine();
		
		if (exists answer) {
			if (answer == "y" || answer == "yes") {
				start();
			}
		}
	}
}