/* kernel.c */
static char* const VGA_MEMORY = (char *)0xb8000;
static const int VGA_WIDTH = 80;
static const int VGA_HEIGHT = 25;

void kernel_early(void) 
{
//do some early work here
}

int main()
{
	const char *str = "Hello World";
	/* Place holder for text string position */
	unsigned int i = 0;
	/* Place holder for video buffer */
	unsigned int j =  0;
	while (str[i] != '\0') {
		VGA_MEMORY[j] = str[i];
		VGA_MEMORY[j + 1] = 0x07;
		i++;
		j = j + 2;
	}

	
		return 0;
}
