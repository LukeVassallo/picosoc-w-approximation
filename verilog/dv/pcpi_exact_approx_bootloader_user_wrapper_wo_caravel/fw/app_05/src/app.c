#include <stdint.h>
#define reg_uart_data (*(volatile uint32_t*)0x02000008)

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

__attribute__((noinline))
int emul_d(int rd, int rs1, int rs2)
{
    asm __volatile__ (".word 0x00C5850B\n");
    asm __volatile__ ("addi %0, x10, 0" : "=r" (rd));
    
    return rd;
}

int emul_ql(int rd, int rs1, int rs2)
{
    asm __volatile__ (".word 0x00C5950B\n");
    asm __volatile__ ("addi %0, x10, 0" : "=r" (rd));
    
    return rd;
}

int emul_qh(int rd, int rs1, int rs2)
{
    asm __volatile__ (".word 0x00C5A50B\n");
    asm __volatile__ ("addi %0, x10, 0" : "=r" (rd));
    
    return rd;
}

__attribute__((noinline))
int amul_d(int rd, int rs1, int rs2)
{
    asm __volatile__ (".word 0x02C5850B\n");
    asm __volatile__ ("addi %0, x10, 0" : "=r" (rd));
    
    return rd;
}



void main(void)
{
	(*(volatile uint32_t*)0x02000004) = 104; // Set UART clock rate
	
	print_str("PCPI Test\n");	

	int8_t a[8] = {-85, 42, -73, 19, 56, -104, 91, -13};
	int8_t b[8] = {-98, 33, -119, 7, 84, -67, 111, -26};
	int c[8] = { 0 };

	print_str("MULTS\n");
	for (int i=0; i<8; i++){
		emul_d(c[i], a[i], b[i]);
		amul_d(c[i], a[i], b[i]);
	}

	// print_str("MULTD\n");
	// for (int i=0; i<8; i++){
	// 	emul_d(c[i], a[i], b[i]);
	// 	amul_d(c[i], a[i], b[i]);
	// }  


	
	return;
}

	// int8_t a[8] = {-85, 42, -73, 19, 56, -104, 91, -13};
	// int8_t b[8] = {-98, 33, -119, 7, 84, -67, 111, -26};
	// uint32_t c[8] = { 0 };
	
	// char str[MAX_DIGITS];

	// print_str("MULTS\n");
	// for (int i=0; i<8; i++){
	// 	uint32_t rs1 = (a[i] & 0xFF) ;
	// 	uint32_t rs2 = (b[i] & 0xFF) ;

	// 	emul_d(c[i], rs1, rs2);
	// 	amul_d(c[i], rs1, rs2);
	// }

	// print_str("MULTD\n");
	// for (int i=0; i<8; i+=2){
	// 	uint32_t rs1 = (a[i] & 0xFF) | ((a[i+1] & 0xFF) << 8); // Shift has higher precedence than bitwise and!
	// 	uint32_t rs2 = (b[i] & 0xFF) | ((b[i+1] & 0xFF) << 8); // Shift has higher precedence than bitwise and!

	// 	emul_d(c[i], rs1, rs2);
	// 	amul_d(c[i], rs1, rs2);
	// }  
