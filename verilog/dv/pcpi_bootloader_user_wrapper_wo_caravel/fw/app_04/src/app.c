#include <stdint.h>
#define reg_uart_data (*(volatile uint32_t*)0x02000008)

#define MAX_DIGITS 11 // Maximum digits for a 32-bit signed integer + null terminator

void *memcpy(void *dest, const void *src, uint32_t n)
{
    for (uint32_t i = 0; i < n; i++)
    {
        ((char*)dest)[i] = ((char*)src)[i];
    }
}

// Function to convert an integer to a string
void intToString(int num, char* str) {
    // Handle negative numbers
    if (num < 0) {
        *str++ = '-';
        num = -num;
    }

    // Convert the integer to a string in reverse order
    char* end = str;
    do {
        //*end++ = num % 10 + '0';
        //num /= 10;
    } while (num > 0);

    // Add null terminator
    *end = '\0';

    // Reverse the string
    while (str < --end) {
        char temp = *str;
        *str++ = *end;
        *end = temp;
    }
}

void putchar(char c)
{
	if (c == '\n')
		putchar('\r');
	reg_uart_data = c;
}

void print_str(const char *p)
{
	while (*p)
		putchar(*(p++));
}

void main(void)
{
	(*(volatile uint32_t*)0x02000004) = 104; // Set UART clock rate

	print_str("PCPI Test\n");

	int a[16] = { 3982, 3472, 4020, 3289, 2520, 3963, 2264, 1826, 2092, 3932, 3167, 2228, 3418, 3629, 2207, 2498 };
	int b[16] = { 1337, 1707, 3653, 768, 1774, 2549, 1120, 3834, 3564, 2678, 1094, 1762, 2442, 2213, 3655, 3960 };
	int c[16] = { 0 };
	int d[16] = { 0 };
	int x[16] = {5319, 5179, 7673};
	int y[16] = {5323934, 5926704, 14685060};
	char str[MAX_DIGITS];
	
	print_str("ADD\n");
	for (int i=0; i<3; i++){
		c[i] = a[i] + b[i];
		if (c[i] != x[i]) 
		{
			print_str("Failed!\n");
			return;
		}
	} 

	print_str("MULT\n");
	for (int i=0; i<3; i++){
		d[i] = a[i] * b[i];
		if (d[i] != y[i]) 
		{
			print_str("Failed!\n");
			return;
		}
	} 

	print_str("OK!\n");
	
	return;
}
