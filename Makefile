# ************************************************************************** #
#                                                                            #
#   Makefile                                                                 #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created: Mon Jun  1 19:25:50 2020                        by elhmn        #
#   Updated: Mon Jun 01 20:47:39 2020                        by elhmn        #
#                                                                            #
# ************************************************************************** #

CORENAME = wasm

SRC = main.c wasm.c
OBJ = $(SRC:.c=.o)

SRCDIR = ./srcs/
OBJDIR = ./objs/
BUILDIR = ./build/

SRCS = $(addprefix $(SRCDIR), $(SRC))
OBJS = $(addprefix $(OBJDIR), $(OBJ))

CC = clang

ifeq ($(WASM), true)
CC = emcc
WASMFLAGS = -s WASM=1
NAME=$(CORENAME).html
else
NAME=$(CORENAME)
endif

INCS = -I ./incs
FLAGS = -Wall -Werror -Wextra $(INCS)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(FLAGS) $(OBJS) -o $(NAME)
	mv $(NAME) $(BUILDIR)

$(OBJS): $(SRCS)
	$(CC) $(FLAGS) $(WASMFLAGS) -c $(SRCS)
	mv $(OBJ) $(OBJDIR)

re: fclean all

clean:
	rm -rf $(OBJ)
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)
	rm -rf $(BUILDDIR)$(NAME)
