.data
welcome_msg: .asciiz "Resturant System"
msg1: .asciiz "\nWhat do you want to Order: "
msg2: .asciiz "Quantity of your order: "
filename: .asciiz "C:/Users/dell/OneDrive/Desktop/COAL LAB PROJECT(CSD201055, CSD201006)/ali.txt"
fileword: .space 1024
bill: .asciiz "\nTotal bill is: "
.text
main:
li $s1, 1
li $s2, 2
li $s3, 3
li $s4, 4
li $s5, 5
li $t9, 0
li $t1, 0
li $t2, 3
la $a0, welcome_msg
li $v0, 4
syscall


li $v0, 13 # open file
la $a0, filename # file name loading
li $a1, 0 # reading file
syscall
move $s0, $v0 # file descriptor
li $v0, 14 # read from file
move $a0, $s0 # file descriptor
la $a1, fileword # buffer holding string of whole file
li $a2, 1024 # size of buffer
syscall
li $v0, 4 # print string in file
la $a0, fileword # load address of buffer
#move $a0, $t6
syscall
li $v0, 16 # close file
move $a0, $s0
syscall


loop:
beq $t1, $t2, exit
add $t1, $t1, 1
la $a0, msg1
li $v0, 4
syscall
li $v0, 5
syscall
move $t0, $v0	#option selection

beq $t0, $s1, op1
beq $t0, $s2, op2
beq $t0, $s3, op3
beq $t0, $s4, op4
beq $t0, $s5, op5

term1:
la $a0, msg2
li $v0, 4
syscall
li $v0, 5
syscall
move $t3, $v0

mul $t4, $t3, $t6
add $t5, $t5, $t4
j loop


exit:

la $a0, bill
li $v0, 4
syscall
move $a0, $t5
li $v0, 1
syscall
li $v0, 10
syscall



op1:
li $t6, 505
j term1
op2:
li $t6, 210
j term1
op3:
li $t6, 460
j term1
op4:
li $t6, 1220
j term1
op5:
li $t6, 120
j term1