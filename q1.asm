.global main
main:
	li a7, 4       
	la a0, message       # prints the message
	ecall

	li a7,5              # takes the size (N) of the triangle from the console.
	ecall

	add t0 , a0, zero         # copy 'message' in a0 to a temp. register to be able to use a0 again.
	li t1 , 0	     	  #  set i =0
	
	j inner_loop

outer_loop:			# this loop initializes a new line after stars are printed
	beq t1,t0, end_outer    # when i = n , terminate the outer loop
	addi t1,t1, 1 	     	# i = i+1
	li t2 , 0	     	# j = 0 which belongs to the inner loop
	
	# the inner loop must locate inside the outer
	inner_loop:		  # this loop prints the essential number of stars
	beq t2 , t1 , end_inner   # when j = i, terminate the inner loop
	addi t2,t2, 1   	  # j = j+1
	li a7, 4       
    	la a0, star		# print '*'
    	ecall 
	j inner_loop		# iterate through the inner loop until j=i
	


end_inner:

	li a7, 4       
	la a0, new_line		# print new line	
	ecall 

	j outer_loop		# go to the outer loop

end_outer:
	
	li a7, 10     # system call to exit
	ecall



.data
    
    new_line: .ascii "\n"
    .byte 0
    star: .ascii "*"
    .byte 0
    
    message: .ascii "Enter the size of the triangle: "
     .byte 0
