boolean victoria = false;
Figura[] figuras;
Figura[] figurasNivel;
void setup() {
  size(800,900);
 figuras = new Figura[7];
  // Parameters go inside the parentheses when the object is constructed.
figuras[0]=new Triangulo(color(0,0,255),100,100,1,0.0025*height);
figuras[1]=new Triangulo(color(255,0,0),100,100,1,0.0025*height);
figuras[2]=new Triangulo(color(0,255,0),300,100,1,0.00175*  height);
figuras[3]=new Triangulo(color(255,0,255),100,100,1,0.00125*height);
figuras[4]=new Triangulo(color(0,255,255),200,100,1,0.00125*height);
figuras[5]=new  Cuadrado(color(255,255,0),200,100,0,0.0025*height);
figuras[6]=new Paralelogramo(color(100,100,255),200,100,0,0.0025*height);
}
void draw() {
  background(255);
  juego();
  condicionDeVictoria();
}
void creador(){
  //juanfer
  saveData();
}

//verificacion juanfer
void condicionDeVictoria(){
  if (victoria == false){
    color negro = color(0,0,0);
    loadPixels();
    int contador = 0;
    for ( int i = 0; i < (width*height); i++ ) {
      color ddd =color(pixels[i]);
        if(negro==ddd && (victoria==false)){
          contador++;
        }
        
     }
     if(contador<4000){
        print("Ganaste");
        victoria = true;
    }
  }
}
void mouseDragged()
{
   for (Figura figura :figuras ){  
    if (figura.seleccion(get(mouseX,mouseY))) {
  figura.move(mouseX-pmouseX,mouseY-pmouseY,0,1);  
  }
}
}
void mouseWheel(MouseEvent event) {
     for (Figura figura :figuras )
     {  
        if (figura.seleccion(get(mouseX,mouseY))) {
          figura.move(0,0,2*event.getCount(),1);  
        } 
     }  

}
void loadData() {
  // Load the JSON file and grab the array.
  JSONObject json = loadJSONObject("niveles.json");
  JSONArray nivelData = json.getJSONArray("nivel1");

  // The size of the array of Bubble objects is determined by the length of the JSON array.
  figurasNivel = new Figura[nivelData.size()]; 
  for (int i = 0; i<nivelData.size(); i++) {
    // Iterate through the array, grabbing each JSON object one at a time.
    JSONObject nivel = nivelData.getJSONObject(i);
    // Get a position object
    float  x = nivel.getFloat("x");
    float y = nivel.getFloat("y");
    float r = nivel.getFloat("r");
    switch (i) {
      case 0:
      figurasNivel[i]=new Triangulo(color(0,0,0),x,y,r,0.0025*height);
      break;
      case 1:
      figurasNivel[i]=new Triangulo(color(0,0,0),x,y,r,0.0025*height);
      break;
      case 2:
      figurasNivel[i]=new Triangulo(color(0,0,0),x,y,r,0.00175*height);
      break;
      case 3:
      figurasNivel[i]=new Triangulo(color(0,0,0),x,y,r,0.00125*height);
      break;
      case 4:
      figurasNivel[i]=new Triangulo(color(0,0,0),x,y,r,0.00125*height);
      break;
      case 5:
      figurasNivel[i]=new Cuadrado(color(0,0,0),x,y,r,0.0025*height);
      break;
      case 6:
      figurasNivel[i]=new Paralelogramo(color(0,0,0),x,y,r,0.0025*height);
      break; 
    }
  }
}
void saveData(){
  //trabajo juanfer
}
