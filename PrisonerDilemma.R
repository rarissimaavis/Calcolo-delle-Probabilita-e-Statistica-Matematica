# Numero di turni di gioco
num_turni <- 100

# Matrice dei payoff: [Azione del Prigioniero 1, Azione del Prigioniero 2]
# Righe: [Accusa, Nega]
# Colonne: [Accusa, Nega]
payoff_matrix <- matrix(c(5, 0, 10, 2), nrow = 2, dimnames = list(c("Accusa", "Nega"), c("Accusa", "Nega")))

# Inizializza le variabili
prigioniero1_payoff_totale <- 0
prigioniero2_payoff_totale <- 0

# Variabili per il conteggio delle azioni
accusa_count1 <- 0
nega_count1 <- 0
accusa_count2 <- 0
nega_count2 <- 0

# Simulazione dei turni di gioco
for (turno in 1:num_turni)
{
  # Genera azioni casuali per i progionieri
  prigioniero1_azione <- sample(c("Accusa", "Nega"), size = 1, replace = TRUE)
  prigioniero2_azione <- sample(c("Accusa", "Nega"), size = 1, replace = TRUE)
  
  # Ottieni i payoff corrispondenti dalla matrice dei payoff
  prigioniero1_payoff <- payoff_matrix[prigioniero1_azione, prigioniero2_azione]
  prigioniero2_payoff <- payoff_matrix[prigioniero2_azione, prigioniero1_azione]
  
  # Aggiorna i payoff totali
  prigioniero1_payoff_totale <- prigioniero1_payoff_totale + prigioniero1_payoff
  prigioniero2_payoff_totale <- prigioniero2_payoff_totale + prigioniero2_payoff
  
  # Conta le azioni del prigioniero 1
  accusa_count1 <- accusa_count1 + (prigioniero1_azione == "Accusa")
  nega_count1 <- nega_count1 + (prigioniero1_azione == "Nega")
  
  # Conta le azioni del prigioniero 2
  accusa_count2 <- accusa_count2 + (prigioniero2_azione == "Accusa")
  nega_count2 <- nega_count2 + (prigioniero2_azione == "Nega")
}

# Calcola le proporzioni delle azioni
accusa_prop1 <- accusa_count1 / num_turni
nega_prop1 <- nega_count1 / num_turni
accusa_prop2 <- accusa_count2 / num_turni
nega_prop2 <- nega_count2 / num_turni

# Calcola le proporzioni dei payoff
prigioniero1_payoff_prop <- prigioniero1_payoff_totale / (prigioniero1_payoff_totale + prigioniero2_payoff_totale)
prigioniero2_payoff_prop <- prigioniero2_payoff_totale / (prigioniero1_payoff_totale + prigioniero2_payoff_totale)

# Categorie per il diagramma a torta delle azioni
cat1 <- c("Accusa", "Nega")

# Categorie per il diagramma a torta dei payoff
cat2 <- c("P1", "P2")

# Dati per il grafico a torta delle azioni
azioni_prop1 <- c(accusa_prop1, nega_prop1)
azioni_prop2 <- c(accusa_prop2, nega_prop2)

# Dati per il grafico a torta dei payoff
payoff_prop <- c(prigioniero1_payoff_prop, prigioniero2_payoff_prop)

# Scelta della palette di colori
library(RColorBrewer)
pal <- brewer.pal(3, "PuRd")

# Visualizza tre diagrammi a torta
par(mfrow = c(1, 3))

# Plot del diagramma a torta delle azioni
pie(azioni_prop1, labels = cat1, col = pal)
title("Azioni P1", line = -6)

# Plot del diagramma a torta delle azioni
pie(azioni_prop2, labels = cat1, col = pal)
title("Azioni P2", line = -6)

# Plot del diagramma a torta dei payoff
pie(payoff_prop, labels = cat2, col = pal)
title("Payoff", line = -6)

# Titolo
mtext("Dilemma del prigioniero", side = 3, line = -5, font = 2, cex = 1.75, outer = TRUE, col = 'slateblue4')
