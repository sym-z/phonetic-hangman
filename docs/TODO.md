# Overall
## Single Player
- [x] Single player
### - [ ] Easy medium and hard choice (4)
## Tutorials and Labeling
- [x] Paste button in password import  
- [ ] Let players know that bluff answers are removed
- [ ] How to play scene?
### - [ ] Change 'Play' to 'hear' for phoneme selection (3)
## Difficulty Management
- [x] Enable the ability to remove random phonemes that arent a part of the word (1)
### - [ ] Correct guesses reveal part of the typed word? (2)
## Sound and art refine
- [x] Placement of word bank in guesser and builder should be the same
- [ ] Sound effect plays after sound when guess has been made
- [ ] Make Mystery Default sprite frame for phoneme selection
  - Being that you have a setting for a mystery guess for a phoneme selection, make the sprite attach depending on that property being true
- [ ] Start up animation with the VHS
- [ ] Teeth break for incorrect guesses?
- [ ] Edit voice to be creepy
- [ ] Add some kind of border or mask to phoneme selections
- [ ] Make label theme for tooth buttons so you can have a nice border
- [ ] Animated mouth framing
- [x] Import new tooth button animation
- [ ] Teeth shake when selected, make shader
- [ ] Word bank consonant and vowel label placment tweak
- [ ] Shading around tooth button placement on mouth framing
## Code Cleanup
- [ ] Get rid of print statments
- [ ] Get rid of commented out code


## Goals
- [x] Add a division between consonants and vowels
- [x] Label consonants and vowels
- [x] Make word preview
- [x] Add text entry
- [x] Identify the difference between the word builder menu, and the guessing menu.
- [x] Put in temporary gifs and get all SpriteFrames created so they can just be remade easily.
- [x] Better password creation algorithm
- [x] If someone uses all guesses, pull up type guess menu and do not allow them to close it
- [x] Guess Phoneme shows selection animation Big Style, NEED A CONTROL THAT CLIPS CHILDREN FOR NORMALIZED SIZES
- [x] Refactor phoneme assembler so that it can do vowels or consonants, then just create 2 containers
- [x] Implement word bank in builder
- [x] Better progress bar in builder that shows 5 anims
- [x] Queue Children need to have labels
- [x] When all sounds have been guessed correctly, do not allow the word bank to open
- [x] Handle duplicate sounds
- [x] Better instructions of how to use tooth buttons in word guesser and word typer
- [x] Create and crop filtered versions
- [x] Menu buttons are triggering behind word bank
- [x] Add new tooth buttons to guesser
- [x] Apply tint to buttons that are not idling
- [x] For added mixed up ness, make the seed sound array length + word length!
- [x] Make instructions that appear that tell the player to use the teeth to control the menus
- [x] VHS Shader randomly brightens and dims pixels at a given rate
- [x] Make password invisible
- [x] Add Copy to Clipboard button
- [x] On Hover for buttons, change the font file
- [x] Create themes for buttons
- [x] Tweak these letters (C, D)
- [x] Add space character to fonts
- [x] Add way to center buttons or create theme to preview how it centers on page
- [x] When whole word is played in builder, change frames to match word that is being played
- [x] Change Click behavior of stylebox
- [x] Phoneme Piece prefab for phoneme queue in builder
  - Or just make the phoneme queue itself a prefab
- [x] Make square/4:3 monitor for the screen
  - Change containers to fit new monitor
- [x] Duplicate phonemes shouldn't increase random pool, just new sounds
- [x] Add text below current phoneme choice in word builder
- [x] Edit mouth_prototype to animate static in the center, this solves the layering problem, but could present new issues with the panel texture that is used in the word bank
- [x] Change all backgrounds to be new background
- [x] CRT Shader
- [x] Quit Game
- [x] Add headers to label scenes, "PASSWORD EXPORTED!" etc.
- [x] For number of letters in word guesser, change to a number instead of repeated '?'s
- [x] Notifications and labels for everything

## Scenes done, but needing polish
- Word builder
  - Consonant and vowel divider
- Word guesser
  - Animation playing when word is selected 
  - Consonant and vowel divider
- Word typer
- Password Export
- Main Menu
- Password Import
- Win Screen
- Loss Screen

## Art Needed
- [x] Font
- [x] Finalize choice for how I want to animate the mouths
- Button Icons
- Backgrounds
- UI Sounds
  - Incorrect Guess
  - Improper Input
  - Win Game
  - Lose Game
  - Music
  - Final Guess Music
- Final Tooth Buttons
- VHS Tearing
- Instructions
- Tooth Life Indicators


## UI Changes
- Buttons to add and listen should be symbols, not words
  - Add to font?
- Create styleboxes and custom fonts

## To Test
- Huge amount of sounds in guesser
- Improper passwords
- More than 44 sounds?