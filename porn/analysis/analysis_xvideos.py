import pandas as pd
from load_data import load_xvideos_data
from clean_data import clean_data
from top_tags import get_top_tags

# Cargar los datos de Xvideos
xvideos_df = load_xvideos_data('../data/xvideos.json')

# Limpiar los datos
xvideos_df = clean_data(xvideos_df)

# Obtener las 10 etiquetas más usadas en inglés y español para Xvideos
top_tags_english_xvideos = get_top_tags(xvideos_df, language='english')
top_tags_spanish_xvideos = get_top_tags(xvideos_df, language='spanish')

print("Top 10 Tags in English for Xvideos:")
print(top_tags_english_xvideos.to_string(index=False))

print("\nTop 10 Tags in Spanish for Xvideos:")
print(top_tags_spanish_xvideos.to_string(index=False))

