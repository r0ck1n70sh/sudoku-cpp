#include "hello.h"
#include <gtkmm/application.h>

int main (int argc, char* argv[]) {
  auto app = Gtk::Application::create(argc, argv, "org.gtkmm.example");

  HelloWorld helloWorld;
  return app->run(helloWorld);
}
