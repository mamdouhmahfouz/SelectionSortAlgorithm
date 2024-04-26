MIPS Assembly Project: Selection Sort and Additional Procedures

This MIPS assembly project focuses on implementing a selection sort algorithm along with additional procedures to manipulate an array of grades representing students' performance. The project includes the following components:

1. Sel_Sort Procedure
   
The Sel_Sort procedure implements the selection sort algorithm to sort an array of grades in ascending order. The algorithm iterates over the array, finding the smallest element in each iteration and swapping it with the element at the current index. This process repeats until the entire array is sorted.

2. Top_rank Procedure
   
The Top_rank procedure identifies the maximum grade in the array. It traverses the array once, keeping track of the maximum grade encountered. The maximum grade is then returned as the result.

3. Sem_abroad Procedure
   
The Sem_abroad procedure identifies students eligible for a semester abroad based on their grades. A student is considered eligible if their grade is 70% or higher. The procedure scans the array of grades, identifying eligible students and storing their indices in a separate array. It also returns the total number of eligible students found.

Selection Sort Algorithm

The selection sort algorithm used in this project operates as follows:

It iterates over the array, searching for the smallest element.
Once found, it swaps the smallest element with the element at the beginning of the unsorted portion of the array.
The process repeats, gradually reducing the size of the unsorted portion until the entire array is sorted.
Usage
To use the provided procedures:


Load the MIPS assembly file containing the implementations into a suitable MIPS assembler or simulator environment.
Call the desired procedure(s) with appropriate parameters, such as the address of the array and the number of elements.
Retrieve the results returned by the procedures, if applicable, for further processing or display.
