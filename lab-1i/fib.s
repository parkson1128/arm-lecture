	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
push {r3, r4, r5, r6, r7, lr}

        @ fib(0)=0
        subs r4, r0, #0
        ble .L3
        @ fib(1)=1
        cmp r4, #1
        beq .L4


                        @@int previous = -1;  R5=-1   n-2
        mov r5, #-1     

                        @@int result = 1;   R6=1   n-1
        mov r6, #1

                        @@int i=0;
        mov r7, #0

                        @@int sum=0;   = fib sum
        mov r3, #0

                        @@for (i = 0; i <= x; i++) {
                        @@      sum = result + previous;
                        @@      previous = result;
                        @@      result = sum;
                        @@ }
                        @@return result;
.loop:

        add r3, r6, r5
        mov r5, r6
        mov r6, r3
        add r7, #1      
        cmp r7, r4      @if i<=X  loop
        ble .loop

        @ R0 = R3 + R0 (update flags)
        adds r0, r3, #0
        pop {r3, r4, r5, r6, r7, pc}            @EPILOG

        @ END CODE MODIFICATION
.L3:
        mov r0, #0                      @ R0 = 0
        pop {r3, r4, r5, r6, r7, pc}            @ EPILOG

.L4:
        mov r0, #1                      @ R0 = 1
        pop {r3, r4, r5, r6, r7, pc}            @ EPILOG

	.size fibonacci, .-fibonacci
	.end
