/*	WordIndexerCtrl	**********************************************/
var WordIndexerCtrl = ctrls.controller('WordIndexerCtrl', [function() {
			//	This application assumes use of the standard ASCII character set, and the
			//	constants below reflect that assumption. The character set could be changed
			//	by querying a Web service for the values of constants and related keyboard mappings, 
			//	or those values could be acquired from the operating system.
	var moi = this;	
	const CHARACTER_SET_SIZE = 26;
	const MAX_WORD_LENGTH = 25;
	const FIRST_CHAR_CODE = 65;
	const LAST_CHAR_CODE = 90;
	const LC_OFFSET = 32;
			
	factorials = new Array(MAX_WORD_LENGTH + 1);
	lettersInUse = new Array((LAST_CHAR_CODE - FIRST_CHAR_CODE) + 1);
	
	moi.numberLetters = 0;	
	moi.uniqueLetters = 0; 
	moi.totalWords = 0; 
	moi.uniqueWords = 0; 
	moi.sortPosition = 0; 
	moi.wordBoxText = "";
	
	factorials[0] = 1.0;
	for (var n = 1.0; n <= MAX_WORD_LENGTH; n++) {
		factorials[n] = factorials[n - 1] * n;
	}
	
	cleanse = function(word) {
		var localWord = word.toUpperCase();
		var cleanWord = "";
		
		for (var i = 0; i < word.length; i++) {
			var charCode = localWord.charCodeAt(i);
			/*	Fold lowercase to UPPERCASE - for languages not supporting toUpperCase()
			||	Question: How do we accommodate character sets with non-contiguous alphabets,
			||	e.g. IBM's EBCDIC? This algorithm won't work for them.
			||	if ((charCode >= FIRST_CHAR_CODE + LC_OFFSET) && (charCode <= LAST_CHAR_CODE + LC_OFFSET)) {
			||		charCode -= LC_OFFSET;
			||	}
			*/
			//	Keep only alphabetic letters, discard non-letters
			if ((charCode >= FIRST_CHAR_CODE) && (charCode <= LAST_CHAR_CODE)) {
				cleanWord = cleanWord.concat(String.fromCharCode(charCode));
			}
		}
		return cleanWord;
	}
	
	countLettersInUse = function(word) {
		for (var j = 0; j < lettersInUse.length; j++) { 
			//	zero out any previous counts
			lettersInUse[j] = 0;
		}
		for (var i = 0; i < word.length; i++) {
			var charCode = word.charCodeAt(i) - FIRST_CHAR_CODE;
			// Accumulate number of uses for each letter
			lettersInUse[charCode]++;	
		} 
	}
	
	countUniqueLetters = function(word) { 
		//	Not used to compute position; used only for info display in UI
		countLettersInUse(word);
		var uniqueLetters = 0;
		for (var k = 0; k < lettersInUse.length; k++) { 
		//	If a letter is used more than once, its count is still only 1
			if (lettersInUse[k] > 0) 
				uniqueLetters++;
		}
		return uniqueLetters;
	}

	computeTotalWords = function(word) {
		return factorials[word.length];
	}
	
	computeUniqueWords = function(word) { 
		//	Distinct Permutations = Total Permutations / Permutations of Repeated Elements
		var totalWords = computeTotalWords(word); 
		var repeatedWords = 1;
		for (var i = 0; i < lettersInUse.length; i++) { 
			if (lettersInUse[i] > 0) {
				repeatedWords *= factorials[lettersInUse[i]];
			}
		}
		return totalWords / repeatedWords;
		console.log("computeUniqueWords(): totalWords=" + totalWords + "; uniqueWords=" + moi.uniqueWords + "; repeatedWords=" + repeatedWords);
	}
	
	computePosition = function(word){
		position = 0;
		var localWord = word;
		while(localWord.length > 0) {
			countLettersInUse(localWord);
			var uniqueWords = computeUniqueWords(localWord);
			var precedingLetters = 0;
			var loopLimit = localWord.charCodeAt(0) - FIRST_CHAR_CODE;
			for (var j = 0; j < loopLimit; j++) {
				precedingLetters += lettersInUse[j];
			}
			var wordsPerLetter = uniqueWords / localWord.length;
			var increment = wordsPerLetter * precedingLetters;
			position += increment;
			// Discard the first letter, then loop
			localWord = localWord.substr(1, localWord.length - 1); 
		}
		position++;			//	Convert from zero-based to one-based
		return position;
	}
	
	//	Invoked whenever the text property of the <input id="wordBoxText" /> changes in the UI
	moi.updateUI = function() {
		console.log("WordIndexerCtrl.updateUI(): wordBoxText=" + moi.wordBoxText);
		moi.wordBoxText = cleanse(moi.wordBoxText);
		moi.numberLetters = moi.wordBoxText.length;
		moi.uniqueLetters = countUniqueLetters(moi.wordBoxText);
		moi.totalWords = computeTotalWords(moi.wordBoxText).toFixed(0);
		moi.uniqueWords = computeUniqueWords(moi.wordBoxText).toFixed(0);
		moi.sortPosition = computePosition(moi.wordBoxText).toFixed(0);
	}
}]);