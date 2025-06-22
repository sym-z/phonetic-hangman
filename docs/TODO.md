## Goals
- [x] Add a division between consonants and vowels
- [x] Label consonants and vowels
- [x] Make word preview
- [x] Add text entry
- [x] Identify the difference between the word builder menu, and the guessing menu.
- [x] Put in temporary gifs and get all SpriteFrames created so they can just be remade easily.
- [x] Better password creation algorithm
- [x] If someone uses all guesses, pull up type guess menu and do not allow them to close it
- [ ] Make Mystery Default sprite frame for phoneme selection
  - Being that you have a setting for a mystery guess for a phoneme selection, make the sprite attach depending on that property being true
- [x] Guess Phoneme shows selection animation Big Style, NEED A CONTROL THAT CLIPS CHILDREN FOR NORMALIZED SIZES
- [x] Refactor phoneme assembler so that it can do vowels or consonants, then just create 2 containers
- [x] Implement word bank in builder
- [x] Better progress bar in builder that shows 5 anims
- [x] Queue Children need to have labels
- [x] When all sounds have been guessed correctly, do not allow the word bank to open
- [ ] Sound effect plays after sound when guess has been made
- [x] Handle duplicate sounds
- [ ] Better instructions of how to use tooth buttons
- [x] Create and crop filtered versions
- [ ] Teeth in the main menu change words on the monitor in the mouth
- [ ] Start up animation with the VHS
- [x] Menu buttons are triggering behind word bank
- [x] Add new tooth buttons to guesser
- [ ] Apply tint to buttons that are not idling
- [x] For added mixed up ness, make the seed sound array length + word length!
- [ ] Make instructions that appear that tell the player to use the teeth to control the menus
- [ ] VHS Shader randomly brightens and dims pixels at a given rate
- [ ] Teeth break for incorrect guesses?
- [ ] Make password invisible
  - Requires a change from a TextEdit node to a LineEdit node
- [ ] Add Copy to Clipboard button
- [x] On Hover for buttons, change the font file
- [x] Create themes for buttons
- [x] Tweak these letters (C, D)
- [x] Add space character to fonts
- [x] Add way to center buttons or create theme to preview how it centers on page
- [ ] When whole word is played in builder, change frames to match word that is being played
- [ ] Edit voice to be creepy
- [ ] Change Click behavior of stylebox
- [ ] Add some kind of border or mask to phoneme selections
- [x] Phoneme Piece prefab for phoneme queue in builder
  - Or just make the phoneme queue itself a prefab
- [x] Make square/4:3 monitor for the screen
  - Change containers to fit new monitor
- [ ] Duplicate phonemes shouldn't increase random pool, just new sounds
- [ ] Add text below current phoneme choice in word builder
- [ ] Make label theme for tooth buttons so you can have a nice border
- [ ] Edit mouth_prototype to animate static in the center, this solves the layering problem, but could present new issues with the panel texture that is used in the word bank
#  Scenes to make
- Single Player

## Scenes in Progress
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

## Scenes done, but needing polish

## Art Needed
- Font
- Finalize choice for how I want to animate the mouths
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

## UI Changes
- Selections need to display word, letter and animation clearly
- Buttons to add and listen should be symbols, not words
- Menus need style
- Create styleboxes and custom fonts

## To Test
- Huge amount of sounds in guesser
- Improper passwords
- More than 44 sounds?