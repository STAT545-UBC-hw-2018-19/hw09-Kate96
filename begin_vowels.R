#Counting the number of words that begin with each of the vowels:
words <- readLines("words.txt")

#Subset the words by vowel in a 1st position:
words_vowels <- list(words_a = words[grep("^[Aa]", words)], 
										 words_e = words[grep("^[Ee]", words)], 
										 words_i = words[grep("^[Ii]", words)],
										 words_o = words[grep("^[Oo]", words)],
										 words_u = words[grep("^[Uu]", words)])

#Calculate the number of words per vowel:
words_vowels_length <- t(as.data.frame(lapply(words_vowels, length), 
																			 row.names = c("Words_sum")))

write.csv(words_vowels_length,
					file = "vowels_word_count.csv")

