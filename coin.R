# Numero di lanci
num_lanci <- 10

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

# Conta le occorrenze di 'Testa' e 'Coda'
count <- table(ris)

# Plot dei risultati
library(RColorBrewer)
pal <- brewer.pal(3, "PuRd") 
barplot(count, main = "Risultati del lancio della moneta", xlab = "Esiti", ylab = "Frequenza", col = pal)
