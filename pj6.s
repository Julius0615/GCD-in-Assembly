// ********************************************************************
// Do not touch the following 2 lists of global symbols:
// ********************************************************************
        .global main, Stop, CodeEnd
        .global DataStart, DataEnd
        .global A, B, GCD
        .global While1, While2




// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// You can add more .globals HERE to export labels to ARM if you wish
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


.global ifStatement, Done1, Done2




// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//      Put your assembler program between the 'main' and the 'Stop' labels
//
//      DO NOT define any variables here (because the content in the
//	variables will be TREATED (by the computer) as INSTRUCTIONS !!!)
//      If you need extra variables, define them in the "Variable Section"
// 	AFTER the Stop  label
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
main:


                //  Write you GCD algorithm here 


 // First, make sure A is largest of the two numbers...
   // if (B > A)
    // { X = A;    // Swap A and B 
     //  A = B;
     //  B = X;
    // }

	// The set up //

	 movw  r0, #:lower16:B
    	 movt  r0, #:upper16:B

	 ldr   r1, [r0] //take value/info stored from address held in register 0 and store in r1
			//value B = r1
	 
	 movw  r2, #:lower16:A
    	 movt  r2, #:upper16:A

	 ldr   r3, [r2] //take value/info stored from address held in register 0 and store in r3
			//value A = r3

	//  If-Statement //

	 cmp   r1, r3
	 bgt   ifStatement

 	 cmp   r1, r3
	 beq   Done1

	 cmp   r1, r3
	 bne   While1

ifStatement:

	 mov   r4, r3 //put A in "X"
	 mov   r3, r1 //put B in A ---> A = B
	 mov   r1, r4 //put A in B ---> B = old A

	 str   r3, [r2]
	 str   r1, [r0]


    //If statement is done. Time for while loop section //

While1: 


         cmp   r1, r3
	 beq   Done1

	 cmp   r1, r3
	 blt   While2
	
	 mov   r4, r3 //put A in "X"
	 mov   r3, r1 //put B in A ---> A = B
	 mov   r1, r4 //put A in B ---> B = old A

 	 str   r3, [r2]
	 str   r1, [r0]

	 b 	While1




While2:

        cmp   r1, r3
	beq   Done1

	cmp   r1, r3
	bgt   While1

	sub     r3, r3, r1 
	str   	r3, [r2]

	b 	While2




Done1:

 	 movw  r5, #:lower16:GCD
    	 movt  r5, #:upper16:GCD
	 
	 ldr   r6, [r5]
	 mov   r6, r1 //put B in GCD
         str   r6, [r5]




// ********************************************************************
// Don't touch the Stop and CodeEnd labels - EGTAPI needs them !!!
// ********************************************************************
Stop:   
	nop

CodeEnd:
	nop



// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// **                          Variable Section                           **
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	.data
DataStart:


// ===============================================================
//    YOU can define variables here IF you need more variables
// ===============================================================


//X:      .skip 4  



// ********************************************************************
// The following variables ate used as input and output of the program 
// (I have defined them for you already)
// 
// ** Don't touch the variables A, B and GCD below this line !!!
// ********************************************************************

A:      .4byte  168
B:      .4byte  651
GCD:    .skip  4



DataEnd:    
	nop

        .end
