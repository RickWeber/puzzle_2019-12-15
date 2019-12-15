# https://fivethirtyeight.com/features/can-you-solve-a-particularly-prismatic-puzzle/

# Players R and S have 5/48 and 3/48 probability of winning a game (and 40/48
# of drawing). They're playing a tournament to six wins. 
# What's the probability S wins three before R wins one?

play <- function(left = 3){ # simulate the rest of the tournament
    if(left < 1){
        return(TRUE)
    }
    if(rbinom(1,1,5/48) == 1) return(FALSE)
    if(rbinom(1,1,3/48) == 1) return(play(left - 1))
    return(play(left))
}

simulation <- rep(3,1e8)
outcome <- sapply(simulation,play)
print(mean(outcome))
