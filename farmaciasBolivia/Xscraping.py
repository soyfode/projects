# Import the necessary libraries. pandas is a data manipulation library and Nitter is a library for scraping tweets from Twitter.
import pandas as pd
from ntscraper import Nitter

# Create an instance of the Nitter class and assign it to the variable scraper.
scraper = Nitter()

# Define a function called get_tweets that takes three arguments: name (the search term), modes (the search mode), and no (the number of tweets to scrape).
def get_tweets(name, modes, no):
    # Use the get_tweets method of the Nitter instance to scrape the tweets.
    tweets = scraper.get_tweets(name, mode=modes, number=no)
    final_tweets = []
    # Loop through the tweets, extracting the text and date of each one.
    for tweet in tweets['tweets']:
        data = [tweet['text'], tweet['date']]
        final_tweets.append(data)
    # Create a pandas DataFrame from this list and return it.
    data = pd.DataFrame(final_tweets, columns=['text', 'date'])
    return data

# Use the function to get the tweets
data = get_tweets('"Farmacias Bolivia"', 'term', 100)

# Export the data to a CSV files
data.to_csv('farmaciaBolivia.csv', index=False)

