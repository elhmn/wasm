# ************************************************************************** #
#                                                                            #
#   Makefile                                                                 #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created: Mon Jun  1 19:25:50 2020                        by elhmn        #
#   Updated: Mon Jun 01 19:29:07 2020                        by elhmn        #
#                                                                            #
# ************************************************************************** #

NAME = wasm

SRCS = main.c

CC = gcc

FLAGS = -Wall -Werror -Wextra

all: $(NAME)

$(NAME): $(SRCS)
	$(CC) $(FLAGS) -o $(NAME) $(SRCS)

re: fclean all

fclean:
	rm -rf $(NAME)
