#include "tccApplication.h"

int main(int argc, char** argv) {
  g_autoptr(MyApplication) app = tccApplication_new();
  return g_application_run(G_APPLICATION(app), argc, argv);
}
