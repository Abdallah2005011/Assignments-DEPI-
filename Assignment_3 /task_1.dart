//Task:1 ☝️

Map<String,double> caculateRectangle(double length,double width ){
  double area=length*width;
  double perimeter=(length+width)*2;

return{'area':area,'perimeter':perimeter};
}
void main(){
 Map <String,double> result= caculateRectangle(5, 3);
 print(result);


}

