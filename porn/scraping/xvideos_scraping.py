# LIBRERÍAS
import random
from time import sleep
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import json

# Importar las librerías necesarias
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import random
from time import sleep
import json

# Crear opciones para el navegador
opts = Options()
opts.add_experimental_option("detach", True)  # Esta opción mantiene el navegador abierto después de que el script finaliza

# Agregar un user-agent para simular un navegador real
opts.add_argument(
    'user-agent=Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/71.0.3578.80 Chrome/71.0.3578.80 Safari/537.36'
)

# Lista de símbolos para generar URLs
symbol = ["09","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

url_list = []

# Generar las URLs y agregarlas a la lista url_list
for i in symbol:
    link = 'https://www.xvideos.com/tags/{}'.format(i)
    url_list.append(link)

# Imprimir las URLs generadas
print(url_list)

# Esperar un tiempo aleatorio entre 2 y 3 segundos
sleep(random.uniform(2.0, 3.0))

# Iterar sobre cada URL en url_list
for url in url_list:

    # Esperar un tiempo aleatorio entre 2 y 3 segundos
    sleep(random.uniform(2.0, 3.0))

    # Imprimir la URL actual
    print(url)

    # Inicializar el navegador Chrome con las opciones especificadas
    driver = webdriver.Chrome('./chromedriver', chrome_options=opts)

    # Abrir la URL en el navegador
    driver.get(url)

    # Esperar un tiempo aleatorio entre 2 y 3 segundos
    sleep(random.uniform(2.0, 3.0))

    # Encontrar todos los elementos que tienen la etiqueta 'li' bajo el id 'tags'
    xvideos = driver.find_elements(By.XPATH, '//*[@id="tags"]/li')

    # Iterar sobre los elementos encontrados
    for x in xvideos:
        # Encontrar el elemento 'b' dentro de 'a' para obtener la etiqueta
        etiqueta = x.find_element(By.XPATH, './/a/b').text
        # Encontrar el elemento 'span' dentro de 'a' para obtener la cantidad
        cantidad = x.find_element(By.XPATH, './/a/span').text
        # Crear un diccionario con la etiqueta y la cantidad
        data = {'etiqueta': etiqueta, 'cantidad': cantidad}
        # Abrir el archivo JSON en modo de añadir ('a') y escribir el diccionario
        with open('xvideos.json', 'a') as f:
            json.dump(data, f, ensure_ascii=False)  # Ensure_ascii=False para caracteres especiales
            f.write(',\n')  # Coma y salto de línea para separar los objetos JSON

    # Cerrar el navegador actual
    driver.quit()

