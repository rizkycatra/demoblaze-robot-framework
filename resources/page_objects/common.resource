*** Settings ***
Library         SeleniumLibrary
Library         ../variables/variables.py
Variables       ../variables/variables.py


*** Keywords ***
User Open The Website
    [Arguments]    ${is_headless}=${False}

    # Inisialisasi objek ChromeOptions asli dari library Selenium Python
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    # Argumen mutlak agar Chrome bisa hidup di dalam Docker / GitHub Actions
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu

    IF    ${is_headless}
        # Menggunakan engine headless terbaru yang direkomendasikan Chrome
        Call Method    ${options}    add_argument    --headless=new
        Call Method    ${options}    add_argument    --window-size\=1920,1080
    END

    # Daftarkan log chromedriver ke file lokal agar jika gagal, log-nya benar-benar tercatat
    ${service}=    Evaluate
    ...    sys.modules['selenium.webdriver.chrome.service'].Service(log_path='chromedriver.log')
    ...    sys

    # Buka browser dengan menyuntikkan objek options dan service asli
    Create Webdriver    Chrome    options=${options}    service=${service}

    Go To    ${URL}

    IF    not ${is_headless}    Maximize Browser Window

Finish Test
    Close Browser
