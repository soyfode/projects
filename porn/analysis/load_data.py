import json
import pandas as pd

def load_xvideos_data(file_path):
    with open(file_path) as f:
        data = json.load(f)
    return pd.DataFrame(data)

