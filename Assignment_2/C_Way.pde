class Way{
  ArrayList<PVector> coordinates;
  color lineColor;
  float lineWeight;

  //Empty constructor
  Way(){}

  //Constructor of coordinates
  Way(ArrayList<PVector> coords, color lineColor, float lineWeight) {
    this.coordinates = new ArrayList<PVector>(coords);
    this.lineColor = lineColor;
    this.lineWeight = lineWeight;
  }

  //Draw the road
  void draw(){
    strokeWeight(lineWeight);
    stroke(lineColor);
    for(int i = 0; i < coordinates.size()-1; i++){
        //iterate through the coordinates and draw lines
        PVector screenStart = mercatorMap.getScreenLocation(coordinates.get(i));
        PVector screenEnd = mercatorMap.getScreenLocation(coordinates.get(i+1));
        line(screenStart.x, screenStart.y, screenEnd.x, screenEnd.y);
    }
  }
}
