import  os
from dotenv import load_dotenv
load_dotenv()

from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service

def get_chrome_driver_path():
    return ChromeDriverManager().install()

#env
URL= "https://www.demoblaze.com"
BROWSER= "chrome"
DRIVER_PATH = get_chrome_driver_path()

#timeouts
TIMEOUT= "10s"

#credentials
DEFAULT_USER= os.getenv("DEFAULT_USER")
DEFAULT_PASS= os.getenv("DEFAULT_PASS")