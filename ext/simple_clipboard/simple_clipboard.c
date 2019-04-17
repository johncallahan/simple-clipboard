#include <ruby.h>
#include <libclipboard.h>
#include "extconf.h"

static clipboard_c *cb = NULL;

VALUE set_text(VALUE _self, VALUE val) {
    Check_Type(val, T_STRING);
    VALUE result = Qnil;
    char *text = clipboard_text(cb);
    if (NULL != text) {
        result = rb_str_new(text, strlen(text));
        free(text);
    }
    if (false == clipboard_set_text(cb, StringValueCStr(val))) {
        rb_raise(rb_eRuntimeError, "Failed to write to clipboard.");
    }
    return result;
}

VALUE get_text(VALUE _self) {
    VALUE result = Qnil;
    char *text = clipboard_text(cb);
    if (NULL != text) {
        result = rb_str_new(text, strlen(text));
        free(text);
    }
    return result;
}

VALUE get_upper_text(VALUE _self) {
    VALUE result = Qnil;
    char *text = clipboard_text(cb);
    if (NULL != text) {
        for(int i;i < strlen(text);i++) text[i] = toupper(text[i]);
        result = rb_str_new(text, strlen(text));
        free(text);
    }
    return result;
}

void Init_simple_clipboard() {
    cb = clipboard_new(NULL);
    if (NULL == cb) {
        rb_raise(rb_eRuntimeError, "Failed to create clipboard context.");
    }
    VALUE mod = rb_define_module("SimpleClipboard");
    rb_define_module_function(mod, "get_text", get_text, 0);
    rb_define_module_function(mod, "set_text", set_text, 1);
    rb_define_module_function(mod, "get_upper_text", get_upper_text, 0);
}
