#Author: Evan Cheng, Loc Nguyen, Bryce Lam, Colin McGough
#Date: 11/28/2022
#Objective: Write a program in Assembly that reverses the elements of the given array.
#int array = [5, 4, 3, 2, 1]

.data
msg1: .asciiz "\nThe elements of the array are: "
msg2: .asciiz "\nThe elements of the array reversed are: "
space: .asciiz " "

array: .word 5, 4, 3, 2, 1

.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	#counter for array
	li $t0, 0
	
	#loop through initial array and push each element onto $sp stack
	j loop

loop:	
	#load current element in $t1
	lw $t1, array($t0)
	
	#print out current element
	li $v0, 1
	move $a0, $t1
	syscall
	
	#print space
	li $v0, 4
	la $a0, space
	syscall
	
	#push $t1 onto the stack
	sub $sp, $sp, 4
	sw $t1, ($sp)
	
	#increment
	add $t0, $t0, 4
	
	#loop condition
	blt $t0, 20, loop
	
	#print out second message
	li $v0, 4
	la $a0, msg2
	syscall
	
	#reset looping and go to next loop
	li $t0, 0
	j loop2
	
loop2:
	#pop element
	lw $t1, ($sp)
	add $sp, $sp, 4
	
	#load popped element into array
	sw $t1, array($t0)
	
	#print out current element
	li $v0, 1
	move $a0, $t1
	syscall
	
	#print space
	li $v0, 4
	la $a0, space
	syscall
	
	#increment
	add $t0, $t0, 4
	
	#loop condition
	blt $t0, 20, loop2
	
exit:
	#exit program
	li $v0, 10
	syscall



