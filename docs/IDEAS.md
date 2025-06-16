### Guess Entry
- Guess entry should let the guessser know the amount of sounds to guess, and the letters in the typed word.
- When you guess a sound correctly, you can see the place it goes in the word, and play the full word.

### Password Generation
- Could hashes be made using the name of your opponent?
- The seed for the randomizer should take in the size of the typed word
- EX:
  - JACK -> Seed Rand w 4
  - J + Rand()
  - A + Rand()
  - C + Rand()
  - K + Rand()
  - Do the same thing but subtract to decode.

### Word Typer
- Force case of entered word, do not allow symbols, numbers, or spaces.

### Word Builder
- Let the player more easily tell the difference between the divisions between vowels and consonants.

### Art Ideas
- Great Experimentation with Aesprite, I can import a spritesheet and apply the following effects for a VHS feel, that I think I want to go with.
  - Apply Texturize
  - Apply Sharpen 3x3
- VHS Aesthetic
  - Record button for making a word
  - CRT Fuzz
  - Tearing with shader?
- Old PC Aesthetic
- Could mix the two into a fake tape based computer system
- Monitor is connected to tape system and buttons
- Buttons are phyiscal buttons on the device
- Computer should look like a NEXT station, but say SYMZ

## Scoring Refactor
- Scoring should count number of guesses instead of incorrect guesses
  - Scoring ranks you instead of ending the game
  - Minimum best score threshold will be something like (num of phonemes) + 10
- Remove guessed letters
- Maybe tell user number of vowels and consonants?
- Maybe remove random sounds that aren't a part of the word
- Could start with certain number of total phonemes or vowel/consonant separation
  - Correct guess removes x number of sounds/vowel+consonant
  - Incorrect guess removes x-y number of sounds/vowel+consonant
- I feel like there is too much choice that can lead to it being too repetitive.
- Maybe user starts with word bank of sounds equal to num of phonemes + x, randomized.
  - Each guess correct additionally removes more sounds?
  - More feeling of deciphering a puzzle this way.
  - Phoneme Assemblers have same optional check for given word, which the word bank has a variable of