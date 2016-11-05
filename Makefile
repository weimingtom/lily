PLAT := 

CC := $(PLAT)gcc 
CPP := $(PLAT)g++
LD := $(PLAT)ld
AR := $(PLAT)ar rcu 
RANLIB := $(PLAT)ranlib
STRIP := $(PLAT)strip
RM := rm -f

CFLAGS := 
CFLAGS +=  -DLILY_VERSION_DIR=\"0_16\" -Wall

LDFLAGS += -Wall -I./src

OBJECTS := 
OBJECTS += src/lily_lexer.o
OBJECTS += src/lily_api_options.o
OBJECTS += src/lily_alloc.o
OBJECTS += src/lily_code_iter.o
OBJECTS += src/lily_symtab.o
OBJECTS += src/lily_pkg_builtin.o
OBJECTS += src/lily_vm.o
OBJECTS += src/lily_type_system.o
OBJECTS += src/lily_expr.o
OBJECTS += src/lily_raiser.o
OBJECTS += src/lily_pkg_sys.o
OBJECTS += src/lily_buffer_u16.o
OBJECTS += src/lily_emitter.o
OBJECTS += src/lily_utf8.o
OBJECTS += src/lily_type_maker.o
OBJECTS += src/lily_msgbuf.o
OBJECTS += src/lily_library.o
OBJECTS += src/lily_parser.o
OBJECTS += src/lily_string_pile.o
OBJECTS += src/lily_value_ops.o
OBJECTS += src/csiphash.o


all : liblily.a lily.exe

lily.exe : liblily.a
	$(CC) $(CFLAGS) -o $@ run/lily.c  liblily.a $(LDFLAGS)
	
liblily.a : $(OBJECTS)
	$(AR) $@ $(OBJECTS) 
	$(RANLIB) $@
	
%.o : %.c
	$(CC) $(CFLAGS) -o $@ -c $<
	
clean :
	$(RM) $(OBJECTS) *.a *.so *.exe
