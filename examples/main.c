#include <stdio.h>

/* These two functions are provided by crt0.o to do any project specific setup
 * before main() gets run. A good candidate for hardware_init_hook() would be
 * a very simple clock setup.
 *
 * void hardware_init_hook(void) {}
 * void software_init_hook(void) {}
 */

int main(void) {
	for(unsigned i = 0;; ++i) {
		printf("Hello world %d\n", i);
	}
}
