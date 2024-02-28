import nltk
import pandas as pd

def get_top_tags(df, language='english'):
    if language == 'english':
        nltk.download('words')
        nltk.download('stopwords')
        english_words = set(nltk.corpus.words.words())
        stop_words = set(nltk.corpus.stopwords.words('english'))
        df['etiqueta'] = df['etiqueta'].apply(nltk.word_tokenize)
        df['etiqueta'] = df['etiqueta'].apply(lambda x: [word.lower() for word in x if word.lower() in english_words])
        df['etiqueta'] = df['etiqueta'].apply(lambda x: ' '.join(x))
        vacias = df[df['etiqueta'] != '']
        vacias = df[df['etiqueta'] != 'teen']
        vacias['etiqueta'] = vacias['etiqueta'].apply(lambda x: ' '.join([word for word in x.split() if word not in stop_words]))
        vacias = vacias[vacias['etiqueta'] != '']
        vacias = vacias.drop_duplicates(subset='etiqueta')
        top_tags = vacias.sort_values(by='cantidad', ascending=False).head(10)
    elif language == 'spanish':
        nltk.download('cess_esp')
        spanish_words = set(nltk.corpus.cess_esp.words())
        stop_words_es = set(nltk.corpus.stopwords.words('spanish'))
        df['etiqueta'] = df['etiqueta'].apply(nltk.word_tokenize)
        df['etiqueta'] = df['etiqueta'].apply(lambda x: [word.lower() for word in x if word.lower() in spanish_words])
        df['etiqueta'] = df['etiqueta'].apply(lambda x: ' '.join(x))
        vacias = df[df['etiqueta'] != '']
        vacias['etiqueta'] = vacias['etiqueta'].apply(lambda x: ' '.join([word for word in x.split() if word not in stop_words_es]))
        vacias = vacias[vacias['etiqueta'] != '']
        vacias = vacias[vacias['etiqueta'] != 'amateur']
        vacias = vacias[vacias['etiqueta'] != 'solo']
        vacias = vacias[vacias['etiqueta'] != 'sur']
        vacias = vacias[vacias['etiqueta'] != 'das']
        vacias = vacias[vacias['etiqueta'] != 'man']
        vacias = vacias[vacias['etiqueta'] != 'dos']
        vacias = vacias[vacias['etiqueta'] != 'ama']
        vacias = vacias[vacias['etiqueta'] != 'bien']
        vacias = vacias[vacias['etiqueta'] != 'mal']
        vacias = vacias[vacias['etiqueta'] != 'red']
        vacias = vacias.drop_duplicates(subset='etiqueta')
        top_tags = vacias.sort_values(by='cantidad', ascending=False).head(10)
    else:
        raise ValueError("Language must be 'english' or 'spanish'")
    
    return top_tags

