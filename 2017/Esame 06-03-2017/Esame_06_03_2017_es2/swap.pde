PImage swap(PImage i, int x1, int y1, int x2, int y2, int s){
    PImage ret = i.copy();
  
    PImage temp1 = i.get(x1 - s/2, y1 - s/2, s, s);
    PImage temp2 = i.get(x2 - s/2, y2 - s/2, s, s);
    
    ret.set(x2 -s/2, y2 - s/2, temp1);
    ret.set(x1- s/2, y1 - s/2, temp2);
    
    return ret;
}
