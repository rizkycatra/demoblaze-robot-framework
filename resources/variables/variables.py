import  os
from dotenv import load_dotenv
load_dotenv()

#env
URL= "https://www.demoblaze.com"
BROWSER= "chrome"

#timeouts
TIMEOUT= "10s"

#credentials
DEFAULT_USER= os.getenv("DEFAULT_USER")
DEFAULT_PASS= os.getenv("DEFAULT_PASS")