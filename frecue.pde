import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim; //inicializa todas las propiedades de audio de la computadora
AudioPlayer player;
FFT fft; //sirve para trabajar con la frecuencia



void setup() {

  background(0);
  size (800, 800);
  minim = new Minim(this);

  player = minim.loadFile("Ivan Noble.mp3", 1024); // loadFile("nombre de archivo", potencia de dos (que cantidad de la información se pone normalemnte se pone 1024-2048));
  player.loop();
  fft = new FFT(player.bufferSize(), player.sampleRate()); //transformar el FFT (de Fourier) 
  println(player.sampleRate());
}

void draw() {
  
  background(0);

  fft.forward(player.mix); //se puede utilizar forward o backward dependiendo si se quiere ir del primero al ultimo o al revés. No marca mucha diferencia casi simpre se usa forward

//  println(fft.getBand(0));
  
  fill(255, 0, 0);
  for (int i=0; i < fft.specSize(); i++) {
    rect(i*10, height, 10, -fft.getBand(i)*100);
  }

  //  float suma = 0.0;
  //  
  //  for (int i=0; i < player.bufferSize(); i++){
  //  suma = suma + abs(player.mix.get(i));
  //  }
  //  
  //  ellipse (width/2, height/2, 40, suma);
  //  
  //  println(player.bufferSize()); //ver cuanto buffer se esta utilizando
  //  println(player.mix.get(0)); //Nos da la primera muestra del buffer
}

