#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

int main(int argc, char const *argv[]){
	/* code */
	if (argc < 4 ){
		printf("usage %s string width prefix mode[NORM or DZEN]\n", argv[0]);
	}
	else{
		
		int maxWidth;
		sscanf (argv[2],"%d",&maxWidth);
		//printf("MAX WIDTH:%i\n", maxWidth);

		int stringWidth;
		stringWidth = strlen(argv[1]);
		//printf("STRING WIDTH:%i\n", stringWidth);
		int prefixWidth;
		prefixWidth = strlen(argv[3]);

		int paddingWidth;
		paddingWidth = (maxWidth - stringWidth - prefixWidth);
		
		int i = 0;
		char partA[stringWidth + 1];
		char partB[stringWidth + 1];
		char const* text = argv[1];
		const char* prefix = argv[3];
		char mode[4];
		if (argv[4] == NULL){
			strncpy(mode, "NORM",4);
		}
		else{
			strncpy(mode, argv[4],4);
		}
		struct timespec tim, tim2;
  		tim.tv_sec = 0;
   		tim.tv_nsec = 500000000L;
		
		int bLoc;

		if (stringWidth > maxWidth){
			while(true){
				strncpy(partB, "", sizeof(partB));
				if ( i == ( stringWidth )){
					i = 0;
				}
				if ( (( i + maxWidth ) > stringWidth) ){

					bLoc = (maxWidth + i - stringWidth);
					strncpy(partB, text, bLoc);
				}

				strncpy(partA, text + i, maxWidth);
				partA[maxWidth] = '\0';
				//fix a dumb dzen behavior that removes trailing spaces by adding a no-break space to the end of the string
				if ( strcmp(mode,"DZEN") == 0){
					printf("%s%s%s\u00A0\n", prefix, partA, partB);
				}
				else{
					printf("%s%s%s\n", prefix, partA, partB);
				}
				fflush(stdout);
				//printf("%s\n", partB);
				i++;
				nanosleep(&tim, &tim2);
			}
		}
		else{
			if ( strcmp(mode,"DZEN") == 0){
					printf("\u00A0%*s%s\u200B\n", paddingWidth, prefix, text);
				}
			else{
				printf("%*s%s\n", paddingWidth, prefix, text);
			}
			fflush(stdout);
		}
	}
	return 0;
}