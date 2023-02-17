.global main

# Selection sort implementation

main:
	li a7, 4
	la a0, message  	# print the messaje for the user
	ecall
	
	li a7 5			# take the array size (n) from the user
	ecall
	
	la t0, length			# t0 = n
	sw a0, 0(t0)		
	li t1, 0			# i = 0
	lw t2, length			# t2 = n
	la t3, array			# represents array[x]
	li t4,0				# j = 0
	li s0, 1
	li s1, 4		

input_array:
	#li a0, 4
	beq t1, t2, print	# if i = array.length, go to print function
	li a7 5			# prompt the user to take the elements of an array
	ecall
	sw a0, 0(t0)
	add t1, t1, s0		# i = i+1
	add t3, t3, s1		# array[i+1]
	j input_array		# continue to take input until it exit the loop
	li a7,1			
	ecall
print:
	#li a0, 4
	beq t4, t2, exit	# if j = array.length, go to exit
	#li a7 1
	lw a0, 0(t0)		# load the value array[j]
	li a7 1			# print the value array[j]
	ecall
	add t4, t4, s0		# j = j+1
	add t3, t3, s1		# array[i+1]
	j print			# iterate through the print function
	#li a7,1
	#ecall
	#ecall

exit:
ret




.data
	message: .ascii "Enter the size of the array: "
     	.byte 0
     	length:	.word 1
     	array:	.word	0 : 150	
