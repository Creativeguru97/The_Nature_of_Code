  
  size(280, 280);
  
  //byte [] data = loadBytes("cat.npy");
  //byte [] data = loadBytes("rainbow.npy");
  byte [] data = loadBytes("train.npy");
  println(data.length);
  
  //float total = (data.length-80)/784;
  //println(total);
  
  int total = 1000;
  
  byte[] outdata = new byte[total * 784];
  int outindex = 0;

  for(int n = 0; n < total; n++){
    //Additional vaule of array before actual data of pixel of the image
  int start = 80 + n * 784;
  PImage img = createImage(28, 28, RGB);
  img.loadPixels();
  for(int i = 0; i < 784; i++){
    int index = i + start;
    byte val = data[index];
    outdata[outindex] = val;
    outindex++;
    img.pixels[i] = color(val & 0xff);
    //img.pixels[i] = color(255- val & 0xff);//White BG
    
  }
  img.updatePixels();
  int x = 28 * (n % 10);//n % 10 : going to be the column number
  int y = 28 * (n / 10);
  image(img, x, y);
  }
  
  //Save compressed bin file of that array of bytes to a binary
  //saveBytes("cat1000.bin", outdata);
  //saveBytes("rainbow1000.bin", outdata);
  saveBytes("train1000.bin", outdata);
