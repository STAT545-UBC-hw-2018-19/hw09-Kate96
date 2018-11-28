library(ggplot2)
p <- ggplot(read.csv("vowels_word_count.csv", row.names = NULL),
						aes(X, Words_sum, fill = X)) +
	geom_bar(stat="identity") +
	xlab("Vowel") + ylab("Number of words") +
	ggtitle("Count of the words beginning with each vowel") +
	scale_x_discrete(labels = c("A", "E", "I", "O", "U")) +
	theme(legend.position="none")

ggsave("vowels_word_count.png", p)
