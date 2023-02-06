main:
	find . -name '*.o' -exec rm -v '{}' \;
	find . -name '*.s' -exec ca65 '{}' \;
	ld65 *.o -C game.cfg -o game.nes

run: game.nes
	fceux game.nes

clean: game.nes
	find . -name '*.o' -exec rm -v '{}' \;
	rm -f game.nes
