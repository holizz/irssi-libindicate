#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"


#include <libindicate/indicator-messages.h>
#include <libindicate/indicator.h>


MODULE = Indicate		PACKAGE = Indicate		


void test()
  CODE:
    printf("Testing\n");

void initialize()
  CODE:
    g_type_init();

    IndicateServer * server = indicate_server_ref_default();

    indicate_server_set_type(server, "message.im");
    indicate_server_set_desktop_file(server, "/usr/share/applications/empathy.desktop");

    DbusmenuServer * dmserver = dbusmenu_server_new("/dbusmenu/path");
    DbusmenuMenuitem * root = dbusmenu_menuitem_new();
    dbusmenu_server_set_root(dmserver, root);

    indicate_server_set_menu(server, dmserver);

void new_message()
  CODE:
    IndicateIndicator * indicator;

    indicator = indicate_indicator_new();
    indicate_indicator_set_property(INDICATE_INDICATOR(indicator), "subtype", "im");
    indicate_indicator_set_property(INDICATE_INDICATOR(indicator), "sender", "IM Client Test");
    GTimeVal time; g_get_current_time(&time);
    indicate_indicator_set_property_time(INDICATE_INDICATOR(indicator), "time", &time);
    indicate_indicator_show(INDICATE_INDICATOR(indicator));

    g_get_current_time(&time);
    indicate_indicator_set_property_time(INDICATE_INDICATOR(indicator), "time", &time);

void mainloop()
  CODE:
    g_main_loop_run(g_main_loop_new(NULL, FALSE));
