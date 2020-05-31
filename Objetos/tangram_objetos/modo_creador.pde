void modo_creador(){

   if (keyPressed) {
    if (key == 'g' || key == 'G'){
      saveData(figuras);
    } 
 }
   for (Figura figuraNivel :figurasNivel ){  
    figuraNivel.display();
}
 for (Figura figura :figuras ){  
    figura.display();
}
if (keyPressed) {
    if (key == 'r' || key == 'R')
    {
     for (Figura figura :figuras )
     {  
        if (figura.seleccion(get(mouseX,mouseY))) {
          figura.move(0,0,0.2,1);  
        } 
     }
    }  
     if (key == 'e' || key == 'E')
    {
     for (Figura figura :figuras )
     {  
        if (figura.seleccion(get(mouseX,mouseY))) {
          figura.move(0,0,-0.2,1);  
        } 
     }
    }  
      if (key == 't' || key == 'T')
    {
     for (Figura figura :figuras )
     {  
        if (figura.seleccion(get(mouseX,mouseY))) {
          figura.move(0,0,0,-1);  
        } 
     }
    }
    if (key == 'a' || key == 'A')
    {
     for (Figura figura :figuras )
     {  
        if (figura.seleccion(get(mouseX,mouseY))) {
          figura.move(-1,0,0,1);  
        } 
     }
    }
    if (key == 's' || key == 'S')
    {
     for (Figura figura :figuras )
     {  
        if (figura.seleccion(get(mouseX,mouseY))) {
          figura.move(0,1,0,1);  
        } 
     }
    }
    if (key == 'w' || key == 'W')
    {
     for (Figura figura :figuras )
     {  
        if (figura.seleccion(get(mouseX,mouseY))) {
          figura.move(0,-1,0,1);  
        } 
     }
    }
    if (key == 'd' || key == 'D')
    {
     for (Figura figura :figuras )
     {  
        if (figura.seleccion(get(mouseX,mouseY))) {
          figura.move(1,0,0,1);  
        } 
     }
    }
}
}
void saveData(Figura[] figuras){
  
 //Aquí debería ir cada pieza   
JSONObject json;  
  JSONArray nivel = new JSONArray();

//En el for pensaba poner figuras.length pero de momento no permite hacerlo

  for (int i = 0; i < 7; i++) {
    JSONObject pieza = new JSONObject();
    pieza.setInt("id", i);
    for (int j = 1; j < 4; j++){
    float[] posicion = figuras[i].getprs();
    pieza.setFloat("prs",posicion[j]);
    nivel.setJSONObject(i, pieza);
    }
  }
  json = new JSONObject();
  json.setJSONArray("piezas", nivel);

  saveJSONObject(json, "data/new.json");  
  }