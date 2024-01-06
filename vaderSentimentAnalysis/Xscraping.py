# Importamos pandas y Nitter
import pandas as pd
from ntscraper import Nitter

# Creamos una instancia de Nitter
scraper = Nitter()

def get_tweets(name, modes, no):
    # Obtenemos los tweets
    tweets = scraper.get_tweets(name, mode=modes, number=no)
    final_tweets = []
    for tweet in tweets['tweets']:
        # Para cada tweet, obtenemos el texto y la fecha
        data = [tweet['text'], tweet['date']]
        final_tweets.append(data)
    # Creamos un DataFrame con los tweets
    # Aquí es donde necesitamos corregir el código
    # Debemos pasar dos nombres de columnas ya que nuestros datos tienen dos elementos
    data = pd.DataFrame(final_tweets, columns=['Tweets', 'Date'])
    return data

# Obtenemos los tweets y los guardamos en un csv
data = get_tweets("ukraine star wars", "term", 1000)
data.to_csv('ukraineData.csv', index=False)

