void keyPressed() {
  if (!selectLightTop && !selectLightBot) {
    return;
  }
  
  if (key == 'g') {
    selectGreen = true;
  }
  else if (key == 'r') {
    selectGreen = false;
  }
  
  else if (key == CODED && keyCode == UP) {
    Light selectedLight = selectLightTop ? lightTop : lightBot;
    
    if (selectGreen) {
      selectedLight.setGreenCycleMs(selectedLight.getGreenCycleMs() + 100);
    } else {
      selectedLight.setRedCycleMs(selectedLight.getRedCycleMs() + 100);
    }
  }
  else if (key == CODED && keyCode == DOWN) {
    Light selectedLight = selectLightTop ? lightTop : lightBot;
    if (selectGreen) {
      selectedLight.setGreenCycleMs(selectedLight.getGreenCycleMs() - 100);
    } else {
      selectedLight.setRedCycleMs(selectedLight.getRedCycleMs() - 100);
    }
  }
}

void mouseClicked() {
  if ( lightTop.getDistance( new PVector(mouseX, mouseY) ) < 25 ) {
    pause = true;
    selectLightTop = true;
    selectLightBot = false;
  }
  else if ( lightBot.getDistance( new PVector(mouseX, mouseY) ) < 25 ) {
    pause = true;
    selectLightTop = false;
    selectLightBot = true;
  }
  else {
    pause = false;
    selectLightTop = false;
    selectLightBot = false;
  }
}
