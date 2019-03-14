#################################
#title: Shot Data Script
#description: extract stat summaries for each player, combine data for all players
#inputs: csv files of stats of each player
#outputs: txt files of player summaries, csv file containing stats of all players
#################################
  
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

iguodala$name <- c("Andre Iguodala")
green$name <- c("Draymond Green")
durant$name <- c("Kevin Durant")
thompson$name <- c("Klay Thompson")
curry$name <- c("Stephen Curry")

iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- c('shot_no')
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- c('shot_yes')
green$shot_made_flag[green$shot_made_flag == 'n'] <- c('shot_no')
green$shot_made_flag[green$shot_made_flag == 'y'] <- c('shot_yes')
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- c('shot_no')
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- c('shot_yes')
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- c('shot_no')
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- c('shot_yes')
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- c('shot_no')
curry$shot_made_flag[curry$shot_made_flag == 'y'] <- c('shot_yes')

iguodala$minute <- (iguodala$period * 12) - iguodala$minutes_remaining
green$minute <- (green$period * 12) - green$minutes_remaining
durant$minute <- (durant$period * 12) - durant$minutes_remaining
thompson$minute <- (thompson$period * 12) - thompson$minutes_remaining
curry$minute <- (curry$period * 12) - curry$minutes_remaining

sink("../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink("../output/draymond-green-summary.txt")
summary(green)
sink()

sink("../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink("../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink("../output/stephen-curry-summary.txt")
summary(curry)
sink()

all_players <- rbind(iguodala, green, durant, thompson, curry)

write.csv(all_players, file = "../data/shots-data.csv")

sink("../output/shots-data-summary.txt")
summary(all_players)
sink()