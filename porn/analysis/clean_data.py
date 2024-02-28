def clean_data(df):
    df['cantidad'] = df['cantidad'].str.replace('.', '')
    df['cantidad'] = df['cantidad'].astype(int)
    for i in range(0, 100):
        df.drop(df[df.cantidad == i].index, inplace=True)
    return df

