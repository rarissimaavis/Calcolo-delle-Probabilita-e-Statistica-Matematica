# Numero di canzoni nella playlist
num_songs <- 50

# Vettore per salvare i risultati
ris <- character(num_songs)

# Generi musicali
generi <- c("Pop", "Rock", "Hip Hop", "Electronic", "Folk", "Jazz")

# Simulazione creazione playlist
for (i in 1:num_songs)
{
  # Genera casualmente un genere
  genere <- sample(generi, 1, replace = TRUE)
  
  # Salva il risultato
  ris[i] <- genere
}

# Calcola le frequenze di ogni esito
freq <- table(ris)

# Categorie per il diagramma a torta
cat <- names(freq)

# Plot del diagramma a torta
library(RColorBrewer)
pal <- brewer.pal(6, "PuRd") 
pie(freq, labels = cat, main = "Generi musicali della playlist", col = pal)
