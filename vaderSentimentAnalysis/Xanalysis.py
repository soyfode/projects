# Importamos las bibliotecas necesarias
import pandas as pd
from nltk.sentiment.vader import SentimentIntensityAnalyzer
import nltk
import plotly.graph_objects as go
from datetime import datetime

# Descargamos el léxico vader que es necesario para el análisis de sentimientos utilizando SentimentIntensityAnalyzer
nltk.download('vader_lexicon')

# Creamos una instancia de la clase SentimentIntensityAnalyzer
sia = SentimentIntensityAnalyzer()

# Leemos el archivo CSV 'ukraineData.csv' en un DataFrame
data = pd.read_csv('ukraineData.csv')

# Convertimos la columna 'Date' a formato de fecha y hora
data['Date'] = data['Date'].apply(lambda x: datetime.strptime(x.replace("·", "").strip(), "%b %d, %Y %I:%M %p %Z"))

# Extraemos la fecha y la hora en columnas separadas
data['Fecha'] = data['Date'].dt.date
data['Hora'] = data['Date'].dt.time

# Convertimos la columna 'Tweets' del DataFrame en una lista
phrases = data['Tweets'].tolist()

# Creamos una lista vacía para almacenar los puntajes de sentimiento
scores = []

# Iteramos sobre cada frase en la lista de frases
for phrase in phrases:
    # Obtenemos los puntajes de sentimiento de la frase
    score = sia.polarity_scores(phrase)
    
    # Añadimos el puntaje de sentimiento a la lista de puntajes
    scores.append(score['compound'])

# Añadimos la lista de puntajes como una nueva columna en el DataFrame
data['Score'] = scores

# Ordenamos el DataFrame por la columna 'Date'
data.sort_values('Date', inplace=True)

# Eliminar la primera fila: Ya que se encuentra en una linea de tiempo muy separada al resto
data = data.iloc[1:]

# exportar a csv, data con coma decimal
data.to_csv('sentimentAnalysis.csv', decimal='.', index=False)

