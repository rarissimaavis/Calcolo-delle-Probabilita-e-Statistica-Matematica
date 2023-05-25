# Numero di lanci del dado
num_lanci <- 100

# Vettore per salvare i risultati
ris <- numeric(num_lanci)

# Simulazione lancio dado
for (i in 1:num_lanci)
{
  # Genera un numero casuale tra 1 e 6
  lancio <- sample(1:6, 1, replace = TRUE)
  
  # Salva il risultato del lancio
  ris[i] <- lancio
}

# Calcola le frequenze di ogni esito
freq <- table(ris)

# Categorie per il diagramma a torta
cat <- names(freq)

# Plot del diagramma a torta
pal <- brewer.pal(6, "PuRd") 
pie(freq, labels = cat, main = "Simulazione del lancio di un dado", col = pal)
