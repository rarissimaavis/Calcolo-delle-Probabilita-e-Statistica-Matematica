# Numero di lanci
num_lanci <- 100

# Vettore per salvare i risultati
ris <- character(num_lanci)

# Simulazione lancio moneta
for (i in 1:num_lanci)
{
  # Genera un numero casuale tra 0 e 1
  num_random <- runif(1)
  
  # Assegna 'Testa' o 'Coda in base al numero generato
  if (num_random < 0.5)
    ris[i] <- 'Testa'
  else
    ris[i] <- 'Croce'
}

# Calcola le frequenze di ogni esito
freq <- table(ris)

# Categorie per il diagramma a torta
cat <- names(freq)

# Plot del diagramma a torta
library(RColorBrewer)
pal <- brewer.pal(3, "PuRd") 
pie(freq, labels = cat, main = "Simulazione del lancio di una moneta", col = pal)
