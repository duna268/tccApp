#ifndef FLUTTER_tccAppLICATION_H_
#define FLUTTER_tccAppLICATION_H_

#include <gtk/gtk.h>

G_DECLARE_FINAL_TYPE(MyApplication, tccApplication, MY, APPLICATION,
                     GtkApplication)

/**
 * tccApplication_new:
 *
 * Creates a new Flutter-based application.
 *
 * Returns: a new #MyApplication.
 */
MyApplication* tccApplication_new();

#endif  // FLUTTER_tccAppLICATION_H_
