# Changes to this branch will not be merged untill after code review

# Game of life
The Game of Life, also known simply as Life, is a cellular automaton devised by the British
mathematician John Horton Conway in 1970. The “game” is a zero-player game, meaning that its
evolution is determined by its initial state, requiring no further input. One interacts with the Game
of Life by creating an initial configuration and observing how it evolves.

## Instructions!
 Clone the project, Open a terminal, and run:

 ```irb bin/start.rb```

## Don't know how to do so? 
  [Clonging from github](https://www.howtogeek.com/451360/how-to-clone-a-github-repository/)

  [Terminal](https://blog.galvanize.com/how-to-use-the-terminal-command-line/)

  [Using IRB](https://www.digitalocean.com/community/tutorials/how-to-use-irb-to-explore-ruby)

## Seeding
  Seed the game with a string of 0s and 1s.

  Must be a string representing a square array.

  Don't add quotes, just numbers separated by spaces!
  
  Examples:

    111 000 111
    0000 0110 0110 000
    01011 11011 10101 10101 01010

    0s are dead cells  1s are living cells

## Verify code quality
 In the command line, run ```bundle install```

 Then ```rubocop```

 Or ```rubycritic lib/``` 

 # Testing

 Run Unit Test: ```rspec``` in the command line

## Game rules

    Any live cell with fewer than two live neighbours dies, as if by under-population.
    Any live cell with two or three live neighbours lives on to the next generation.
    Any live cell with more than three live neighbours dies, as if by overpopulation.
    Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
 
