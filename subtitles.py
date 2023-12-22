import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.common.exceptions import TimeoutException
from selenium.common.exceptions import NoSuchElementException

# ------------------setup/config------------------
service = Service("/home/pleasework/IT/extra/Python/Web_Scraping/chromedriver")

brave_bin_path = "/usr/bin/brave-browser"
options = webdriver.ChromeOptions()
options.binary_location = brave_bin_path


prefs = {"download.default_directory": "</home/pleasework/Downloads",
        "download.prompt_for_download": False}

options.add_experimental_option("prefs", prefs)

driver = webdriver.Chrome(service=service, options=options)

wait = WebDriverWait(driver, 5)
# ------------------setup/config------------------


driver.get("https://www.google.com")


# --------------------handle cookies---------------------
try:
    consent_banner = wait.until(
        EC.presence_of_element_located((By.ID, "L2AGLb"))
    )
    disagree_button = consent_banner.find_element(
        By.XPATH, '//*[@id="W0wltc"]/div')
    disagree_button.click()
except NoSuchElementException:
    pass
# --------------------handle cookies---------------------

# --------------------user input---------------------

search = str(input())
year = str(input())

# --------------------user input---------------------

# --------------------get the website--------------------

search_box = driver.find_element(By.XPATH, '//*[@id="APjFqb"]')

# search_box.send_keys(search + " " + year + ' titlovi')
search_box.send_keys(search + ' titlovi')
search_box.submit()  # proceed

# find first google result & click
google_first_result = driver.find_element(
    By.PARTIAL_LINK_TEXT, "https://titlovi.com").click()

# --------------------get the website--------------------

# ------------------finding subtitles-----------------

wait.until(EC.presence_of_element_located(
    (By.CSS_SELECTOR, "li.subtitleContainer")))
subtitles = driver.find_elements(By.CSS_SELECTOR, "li.subtitleContainer")


# ------------------finding subtitles-----------------

# ------------------target languages-----------------

serbian = "https://static.titlovi.com/titlovicom/content/images/flags/rs3.png"
croatian = "https://static.titlovi.com/titlovicom/content/images/flags/hr3.png"
languages = [croatian, serbian]

# ------------------target languages-----------------

redirect_links = []

for subtitle in subtitles:

    # ----------------filtering subtitles----------------

    if 'canEdit' not in subtitle.get_attribute('class'):
        continue  # class name

    language = subtitle.find_element(
        By.CSS_SELECTOR, "div.icons img.lang").get_attribute('src')
    if language not in languages:
        continue  # language

    subtitle_year = subtitle.find_element(
        By.XPATH, ".//h3/i").text[1:5]  # remove ()
    if year != "":  # if year is set
        if subtitle_year != year:
            continue  # year

# ----------------done filtering----------------

    #   obtain redirect link
    redirect_link = subtitle.find_element(
        By.CSS_SELECTOR, "div.download > a").get_attribute('href')
    redirect_links.append(redirect_link)

# ----------------downloading subtitles----------------

for redirect_link in redirect_links:
    driver.get(redirect_link)

    # find download link
    download_link = wait.until(EC.presence_of_element_located(
        (By.XPATH, "//div[@class='bottom']//a[contains(@href, '/download/?type=1&mediaid=')]"))).click()

    driver.back()


# ----------------downloaded----------------


# Close the webdriver
driver.quit()
