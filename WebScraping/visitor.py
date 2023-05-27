from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

# Ruta al controlador de Selenium para Brave
brave_driver_path = '/ruta/al/controlador/brave_driver.exe'

# Configuración del servicio del controlador de Selenium
service = Service(brave_driver_path)

# Inicializar el navegador Brave usando el controlador
options = webdriver.ChromeOptions()
options.binary_location = 'C:/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe'  # Ruta al ejecutable de Brave
options.add_argument("--start-maximized")  # Maximizar la ventana del navegador
driver = webdriver.Chrome(service=service, options=options)

# Realizar la visita al sitio web 100 veces
url = "https://www.github.com/Cervantes21"  # Cambia la URL al sitio web que deseas visitar

for _ in range(100):
    driver.get(url)

# Cerrar el navegador al finalizar
driver.quit()
