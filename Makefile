# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Jpaulis <Jpaulis@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/09 16:26:29 by Jpaulis           #+#    #+#              #
#    Updated: 2025/01/10 17:38:39 by Jpaulis          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS_SVR = server.c utils.c
SRCS_CLT = client.c utils.c

OBJS_DIR = objs/

SRCS_SVR_OBJS = $(addprefix $(OBJS_DIR),$(SRCS_SVR:.c=.o))
SRCS_CLT_OBJS = $(addprefix $(OBJS_DIR),$(SRCS_CLT:.c=.o))

NAME_SVR = server
NAME_CLT = client

CC = gcc
FLAGS = -Werror -Wextra -Wall

all: $(OBJS_DIR) $(NAME_CLT) $(NAME_SVR)

$(OBJS_DIR):
	@$(CC) $(FLAGS) -c $(SRCS_CLT) $(SRCS_SVR)
	@mkdir -p $@
	@mv *.o $@

$(NAME_CLT):
	@$(CC) $(FLAGS) -o $@ $(SRCS_CLT_OBJS)
	@printf "\033[0;32mClient Compiled\n\e[0m"

$(NAME_SVR):
	@$(CC) $(FLAGS) -o $@ $(SRCS_SVR_OBJS)
	@printf "\033[0;32mServer Compiled\n\e[0m"


clean:
	@rm -f $(NAME_CLT) $(NAME_SVR)

fclean:
	@rm -f $(NAME_CLT) $(NAME_SVR)
	@rm -rf $(OBJS_DIR)
	@printf "\033[0;31mDeleted Server, Client and Objects\n\e[0m"

re: fclean all

.PHONY: clean fclean re all
