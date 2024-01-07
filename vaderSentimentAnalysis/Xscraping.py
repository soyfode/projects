# Import necessary libraries
import pandas as pd
from nltk.sentiment.vader import SentimentIntensityAnalyzer
import nltk
import plotly.graph_objects as go
from datetime import datetime

# Download the vader lexicon which is necessary for sentiment analysis using SentimentIntensityAnalyzer
nltk.download('vader_lexicon')

# Create an instance of the SentimentIntensityAnalyzer class
sia = SentimentIntensityAnalyzer()

# Read the 'ukraineData.csv' file into a DataFrame
data = pd.read_csv('ukraineData.csv')

# Convert the 'Date' column to datetime format
data['Date'] = data['Date'].apply(lambda x: datetime.strptime(x.replace("·", "").strip(), "%b %d, %Y %I:%M %p %Z"))

# Extract the date and time into separate columns
data['Fecha'] = data['Date'].dt.date
data['Hora'] = data['Date'].dt.time

# Convert the 'Tweets' column of the DataFrame into a list
phrases = data['Tweets'].tolist()

# Create an empty list to store sentiment scores
scores = []

# Iterate over each phrase in the list of phrases
for phrase in phrases:
    # Get the sentiment scores of the phrase
    score = sia.polarity_scores(phrase)
    
    # Add the sentiment score to the list of scores
    scores.append(score['compound'])

# Add the list of scores as a new column in the DataFrame
data['Score'] = scores

# Sort the DataFrame by the 'Date' column
data.sort_values('Date', inplace=True)

# Remove the first row: As it is on a very separate timeline to the rest
data = data.iloc[1:]

# Export to csv, data with decimal comma
data.to_csv('sentimentAnalysis.csv', decimal='.', index=False)

