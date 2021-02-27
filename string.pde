int numParticles = 10;

Particle[] particles = new Particle[numParticles];
Spring[] springs = new Spring[numParticles - 1];

float separation = 20;

PVector gravity = new PVector(0, 0.1);

void setup() {
  size(800, 600);

  particles[0] = new Particle(200, 15, 30, 10, color(255, 0, 0), true);

  for ( int i = 1; i < particles.length; i++) {
    particles[i] = new Particle(200, 15+separation*i, 30, 10, color(255), false);
    springs[i-1] = new Spring(0.5, separation, particles[i-1], particles[i]);
  }
}

void draw() {
  if (mousePressed) {
    particles[particles.length - 1].position.set(mouseX, mouseY);
    particles[particles.length - 1].velocity.set(0, 0);
  }

  background(100);

  for (int i = 0; i < springs.length; i++) {
    springs[i].update();
  }

  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
  }

}
