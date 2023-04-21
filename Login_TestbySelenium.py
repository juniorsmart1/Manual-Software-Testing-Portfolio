from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
import time

username = "student"
password = "Password123"

#เปิด Browser
driver = webdriver.Chrome()
driver.implicitly_wait(2)

#เปิด Web Page
driver.get('https://practicetestautomation.com/practice-test-login/')

#ระบุตำแหน่ง Xpath
time.sleep(2)
user = driver.find_element(By.ID,'username')
pas = driver.find_element(By.ID,'password')

time.sleep(2)
user.send_keys(username)
pas.send_keys(password)

time.sleep(2)
submit = driver.find_element(By.XPATH,'//*[@id="submit"]')
submit.click()
time.sleep(2)

time.sleep(2)
Logout = driver.find_element(By.XPATH,'//*[@id="loop-container"]/div/article/div[2]/div/div/div/a')
Logout.click()
time.sleep(2)








