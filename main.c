#include <stdio.h>

extern int access_hash(char *pin);
extern int clearance_level(int hash);
extern int lucas(int n);
extern int bonus(char *pin);

int main(){
	
	char pin[] = "A9b3";
	printf("Pin is: %s\n", pin); // test pin and printf
	
	int hash, level, final_pin, checksum;
	
	hash = access_hash(pin);
	printf("Hash: %d\n", hash);
	
	level = clearance_level(hash);
	printf("Clearance level is %d\n", level);
	
	final_pin = lucas(level);
	printf("Final unlock pin is: %d\n", final_pin);
	
	checksum = bonus(pin);
	printf("Checksum of initial pin: 0x%X\n\n", checksum);
	
	return 0;
}