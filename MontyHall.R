# Calcolo della probabilità di vincere se si cambia la porta

# Numero di turni di gioco
num_turni <- 100

# Inizializza il numero di vittorie a 0 e il numero di porte a 3
num_vittorie <- 0
num_porte <- 3
x <- c(1:num_porte)

# Simulazione 
for (i in 1:num_turni)
{
  # Inizializza le porte a 0 (senza premio)
  porte <- rep(0, num_porte) 
  
  # Estrai casualmente una porta (indice) per il premio
  premio <- sample(x, 1) 
  
  #  Assegna 1 alla porta contenente il premio 
  porte[premio] <- 1
  
  # Il concorrente sceglie una porta da aprire
  scelta <- sample(x, 1)
  
  # Se la porta scelta contiene il premio, allora l'host apre una delle altre due porte (senza premio)
  # e lascia chiusa quella che diventa la seconda scelta del concorrente
  if (porte[scelta] == 1) scelta2 <- sample(x[-premio], 1)
  
  # Se invece la porta scelta non contiene il premio, l'host apre la porta senza premio tra le due rimanenti
  # e lascia chiusa quella col premio, che diventa la seconda scelta del concorrente
  if (porte[scelta] != 1) scelta2 <- premio
  
  # Se la seconda porta scelta dal concorrente contiene il premio, incrementa il numero di vittorie
  if (porte[scelta2] == 1) num_vittorie <- num_vittorie + 1
}

# Calcola la proporzione di vittorie
prop_vittorie <- num_vittorie / num_turni
  
# Dati per il diagramma a torta 
v <- c(prop_vittorie, 1-prop_vittorie)
  
# Stampa delle percentuali
print(v)
  
# Categorie per il diagramma a torta
cat <- c("vittorie", "sconfitte")
  
# Diagramma a torta
pie(v, labels = cat, main = "Probabilità di vincere cambiando porta")

# Titolo
mtext("Monty Hall", side = 3, line = -5, font = 2, cex = 1.75, outer = TRUE, col = 'deepskyblue4')
  
