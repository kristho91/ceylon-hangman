import ceylon.collection { HashSet }
import ceylon.random { DefaultRandom }

by("Kris Thomsen")
class HangmanGame() {
	
	variable Integer wrongGuessCount = 0;
	
	value guesses = HashSet<Character>();
	value words = [ "bob", "santa", "door" ];
	value currentWord = DefaultRandom().nextElement(words);

	shared Boolean wrongGuessLimitReached() => wrongGuessCount == 5;
	
	void increaseWrongGuessCount() => wrongGuessCount++;
	
	shared Boolean printStatus() {
		variable Integer missingLetters = 0;
		variable String status = "";
		
		for (l in currentWord) {
			if (guesses.contains(l)) {
				status += l.string;
			} else {
				status += "_";
				missingLetters++;
			}
		}
		
		print(status);
		
		return missingLetters == 0;
	}
	
	shared Boolean makeGuess(Character letter) {
		guesses.add(letter);
		
		if (!currentWord.contains(letter)) {
			increaseWrongGuessCount();
			return false;
		}
		
		return true;
	}
}