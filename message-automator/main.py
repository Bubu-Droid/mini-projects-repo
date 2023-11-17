import pyautogui, time, random

cfCount = 10
cfText = f"owo cf {cfCount}"
huntText = "owoh"
battleText = "owob"
fixGap = 18
arbGap = 2

def msgSend(mesg):
    pyautogui.typewrite(mesg, interval=0.1)
    pyautogui.press('enter')

def timeGap():
    t = fixGap + (arbGap * random.random())
    time.sleep(t)

n = int(input("Enter the number of times you want the automator to iterate: "))

for i in range(5, 0, -1):
    print(f"Starting in {i}!")
    time.sleep(1)

for i in range(1, n+1):
    # msgSend(cfText)
    pyautogui.hotkey('ctrl', '2')
    msgSend(huntText)
    msgSend(battleText)
    pyautogui.hotkey('ctrl', '3')
    timeGap()
