# ************************************************************************** #
#                                                                            #
#   Makefile                                                                 #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created: Mon Jun  1 19:25:50 2020                        by elhmn        #
#   Updated: Mon Jun 01 20:03:57 2020                        by elhmn        #
#                                                                            #
# ************************************************************************** #

CORENAME = wasm

SRCS = main.c
OBJS = $(SRCS:.c=.o)

CC = clang

ifeq ($(WASM), true)
CC = emcc
WASMFLAGS = -s WASM=1
NAME=$(CORENAME).html
else
NAME=$(CORENAME)
endif

FLAGS = -Wall -Werror -Wextra

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(FLAGS) $(OBJS) -o $(NAME)

$(OBJS): $(SRCS)
	$(CC) $(FLAGS) $(WASMFLAGS) -c $(SRCS)

re: fclean all

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)
