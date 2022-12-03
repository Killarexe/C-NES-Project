#Comilers and linkers for building the NES rom
CC65 := cc65
CA65 := ca65
LD65 := ld65

#Compiler and linker configuration
CONFIG := nrom_32k_vert.cfg

#Folders
CHRS 		:= chrs
LIBS 		:= libs
BUILD 		:= build
INCLUDE 	:= include
SOURCEDIR 	:= src

#Output
#WARNING: Don't put the name as 'test' i don't know why
NAME := nes_game

all:
	@clear
	@echo NES Rom compiling started...
	@echo Compile libraies...
	$(CA65) $(LIBS)/crt0.s -o $(BUILD)/crt0.o
	@echo Compile programs...
	@make compile
	$(CA65) $(BUILD)/$(NAME).s -g -o $(BUILD)/$(NAME).o
	@echo Building rom...
	$(LD65) -C $(CONFIG) -o $(BUILD)/$(NAME).nes $(BUILD)/crt0.o $(BUILD)/$(NAME).o nes.lib -Ln $(BUILD)/labels.txt --dbgfile $(BUILD)/dbg.txt
	@echo $(NAME).nes created!
	@echo NES Rom complete!

compile: $(SOURCEDIR)/*.c $(INCLUDE)/*.h
	$(CC65) -Oirs $< -o $(BUILD)/$(NAME).s

run:
	@nes $(BUILD)/$(NAME).nes

clean:
	@clear
	@rm $(BUILD)/*