.global main

main:
	li a7, 4
 	la a0, message		# print the message
 	ecall
 	
 	li a7, 5		# read the integer x
 	ecall
 	
 	jal function		# go to 'function'
 	li a7, 1		# print the result
	ecall
	li a7, 10		# system call to exit
	ecall
 function:
 	addi t0, a0, 0		# copy input number to a temp register
 	beq t0, zero, return_5   # if x = 0 return 5
 	bgt t0, zero, recurse	# else calculate the recursion
 	
recurse:
 	addi sp, sp, -8		# adjust stack for 2 items
 	sw ra, 0(sp)
 	sw a0, 4(sp)
 	addi a0, a0, -1		# x--
 	jal function		# go to function
 	slli a0, a0, 1		# 2*f(x-1)
 	lw a1, 4(sp)		# 2*f(x-1)+x
 	add a0, a0,a1		# a0 = t3+x = 2*f(x-1)+x
 	lw ra, 0(sp)
 	addi sp,sp,8		# close stack pointers for 2 items
 	jalr zero, ra,0
 	
return_5:
 	li a0, 5		# set return value to 5
 	jalr zero, ra,0
 	
 
 	 

	 
	 	 
.data
	new_line: .ascii "\n"
    	.byte 0
    
    	message: .ascii "Enter the value of x: "
     	.byte 0