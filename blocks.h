//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "modules/music.sh",                                          	1,              8},
	{"", "modules/torrent.sh",						20,		0},	
	{"", "modules/pacpackages.sh",						30,		0},
	
	{"", "modules/volume.sh",						0,		8},

	{"", "modules/clock.sh",						60,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
