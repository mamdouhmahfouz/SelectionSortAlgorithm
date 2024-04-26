.data
array: .word 3, 2, 70, 75, 5
sem : .space 5

.text
.globl main

main:
    la $a0, array
    addi $a1, $zero, 5
    la $a2,sem
    jal Sel_Sort
    jal semAbroad
    jal topRank
    move $a0,$v0
    li $v0,1
    syscall
    
   
  
   
            
   
    li $v0, 10
    syscall

Sel_Sort:
#Stack storing process
addi $sp,$sp,-44
sw $s0,0($sp)
sw $s1,4($sp)
sw $t0,8($sp)
sw $t6,12($sp)
sw $t2,16($sp)
sw $t4,20($sp)
sw $t5,24($sp)
sw $t7,28($sp)
sw $t9,32($sp)
sw $t8,36($sp)
sw $ra,40($sp)
#end of stack
    addi $s0, $a1, -1     # s0 is length - 1
    addi $s1, $zero, 0    # i = 0
outer:
    bge $s1, $s0, exit
    move $t0, $s1         # minIndex = i
    addi $t6, $s1, 1     # $t6 is j = i + 1
inner:
    sll $t2, $t0, 2
    add $t4, $t2, $a0# base adress index
    lw $t5, 0($t4)       # a[minIndex]
    bge $t6, $a1, swap
    sll $t7, $t6, 2		
    add $t8, $t7, $a0
    lw $t9, 0($t8)       # a[j]
    bge $t9, $t5, exit_inner
    sw $t9, 0($t4)
    sw $t5, 0($t8)
    addi $t6, $t6, 1
    j inner
exit_inner:
    addi $t6, $t6, 1
    j inner

swap:
    sll $t8, $t0, 2      # $t8 = minIndex * 4
    add $t8, $a0, $t8    # $t8 = &array[minIndex]
    lw $t9, 0($t8)       # $t9 = array[minIndex]
    sll $t4, $s1, 2      # $t4 = i * 4
    add $t4, $a0, $t4    # $t4 = &array[i]
    lw $t5, 0($t4)       # $t5 = array[i]
    sw $t5, 0($t8)       # array[i] = array[minIndex]
    sw $t9, 0($t4)       # array[minIndex] = array[i]
    addi $s1, $s1, 1
    
    j outer

exit:
#Stack loading process

lw $s0,0($sp)
lw $s1,4($sp)
lw $t0,8($sp)
lw $t6,12($sp)
lw $t2,16($sp)
lw $t4,20($sp)
lw $t5,24($sp)
lw $t7,28($sp)
lw $t9,32($sp)
lw $t8,36($sp)
lw $ra,40($sp)
addi $sp,$sp,44
#end of stack
    move $v0, $a0         # Move sorted array from $a0 to $v0
    jr $ra
    
#..........................................................................................................................................
    
    
   
#TOP RANK
  topRank:
    # Stack storing process
    addi $sp, $sp, -24
    sw $ra, 0($sp)
    sw $t1, 4($sp)
    sw $t2, 8($sp)
    sw $s1, 12($sp)
    sw $t3, 16($sp)
    sw $t4,20($sp)
    # End of stack storing process
    move $t1, $a1           
    addi $t1, $t1, -1      
    sll $t2, $t1, 2        
    jal Sel_Sort     
    move $s1, $v0           # Base address of sorted array
    add $t3, $s1, $t2       
    lw $t4, 0($t3)          # Load the last element aka the largest from the sorted array
    move $v0, $t4           # Return the largest element

    # Stack loading process
    lw $ra, 0($sp)
    lw $t1, 4($sp)
    lw $t2, 8($sp)
    lw $s1, 12($sp)
    lw $t3, 16($sp)
    lw $t4,20($sp)
    addi $sp, $sp, 20
    # End of stack loading process

    jr $ra                  # Return to the calling function

#................................................................................................................................................

    
#SEM ABROAD
semAbroad:
    # Stack storing
    addi $sp, $sp, -36
    sw $t1, 0($sp)
    sw $t2, 4($sp)
    sw $t3, 8($sp)
    sw $t4, 12($sp)
    sw $t5, 16($sp)
    sw $t6, 20($sp)
    sw $s0, 24($sp)
    sw $s1, 28($sp)
    sw $ra, 32($sp)
    # End of stack storing

    move $t1, $a0
    move $t2, $a2
    li $t3, 0   # i value
    move $s0, $a1  # length
    li $s1, 0  # j value

    addi $s1, $zero, 0  # Reset the value of j to 0

while:
    beq $t3, $s0, endWhile
    sll $t4, $t3, 2  # index in array
    add $t4, $t4, $t1  # adds base address
    lw $t5, 0($t4)  # element in original array
    
    li $t6, 70
    bge $t5, $t6, storeElement#checks if the element/grade is greater than 70

    addi $t3, $t3, 1  # increment i value
    j while

storeElement:
    sll $t6, $s1, 2  # index in new array
    add $t6, $t6, $t2  # adds base address of new array
    sw $t5, 0($t6)  # stores the value in the new array
    addi $s1, $s1, 1  # increment j value
    addi $t3, $t3, 1  # increment i value
    j while

endWhile:
    # Stack loading
    lw $t1, 0($sp)
    lw $t2, 4($sp)
    lw $t3, 8($sp)
    lw $t4, 12($sp)
    lw $t5, 16($sp)
    lw $t6, 20($sp)
    lw $s0, 24($sp)
    lw $s1, 28($sp)
    lw $ra, 32($sp)
    addi $sp, $sp, 36
    # End of stack loading
    move $v1, $t6
    jr $ra
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

