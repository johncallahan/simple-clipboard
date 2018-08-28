#include <string.h>
#include <ruby.h>
#include <libclipboard.h>
#include "extconf.h"

static clipboard_c *cb = NULL;

VALUE get_text() {
    char *text = clipboard_text(cb);
    VALUE result = rb_str_new(text, strlen(text));
    free(text);
    return result;
}

VALUE set_text(VALUE _self, VALUE str) {
    Check_Type(str, T_STRING);
    char *text = clipboard_text(cb);
    VALUE result = rb_str_new(text, strlen(text));
    free(text);
    clipboard_set_text(cb, StringValueCStr(str));
    return result;
}

void Init_simple_clipboard() {
    cb = clipboard_new(NULL);
    if (NULL == cb) {
        rb_raise(rb_eRuntimeError, "Failed to create clipboard context.");
    } else {
        VALUE mod = rb_define_module("SimpleClipboard");
        rb_define_module_function(mod, "get_text", get_text, 0);
        rb_define_module_function(mod, "set_text", set_text, 1);
    }
}
