#include <stdio.h>
#include "testbench.h"

extern int access_hash(char *pin);
extern int clearance_level(int hash);
extern int lucas(int n);
extern int bonus(char *pin);

int main(){
	
	char pin[] = "A9b3";
	printf("Pin is: %s\n", pin); // test pin and printf
	
	int hash, level, final_pin, checksum;
	int c_hash, c_level, c_final_pin, c_checksum;
	
	hash = access_hash(pin);
	printf("Hash: %d\n", hash);
	
	level = clearance_level(hash);
	printf("Clearance level is %d\n", level);
	
	final_pin = lucas(level);
	printf("Final unlock pin is: %d\n", final_pin);
	
	checksum = bonus(pin);
	printf("Checksum of initial pin: 0x%X\n\n", checksum);
	
	//testbench
	c_hash = c_access_hash(pin);
	c_level = c_clearance_level(hash);
	c_final_pin = c_lucas(c_level);
	c_checksum = c_bonus(pin);
	printf("Expected outputs from testbench:\n");
	printf("c_hash: %d\n",c_hash);
	printf("c_level: %d\n",c_level);
	printf("c_final_pin: %d\n",c_final_pin);
	printf("c_checksum: 0x%X\n",c_checksum);
	
	return 0;
}