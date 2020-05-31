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
  //modo_creador();
  condicionDeVictoria();
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
