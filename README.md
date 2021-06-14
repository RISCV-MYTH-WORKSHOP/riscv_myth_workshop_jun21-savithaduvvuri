# RISC-V_MYTH_Workshop

For students of "Microprocessor for You in Thirty Hours" Workshop, offered by for VLSI System Design (VSD) and Redwood EDA, find here accompanying live info and links.

Check the folders for assignments for particular days.

RISC V contains 0-31 registers named by x31-x0:
- each RISCV32 register is 32 bits wide.  
- INstructions are always fixed and they are 32b long.
- Each instruction type (RISBUJ) corresponding to reg type, Immediate type, Store type, Branch type, upper imeediate, Jump type.
- Instructions syntax :
-   - - add x1 , x2 , x3 :  Here, Add is the opcode, x1 is the rd (destination register) , x2 (rs1 - Source register) , x1 (rs2 - Source register2) .
-   Here, we are giving the ASM instructions as inputs and design the CPU to give outputs for any instructions that we give. 
-   Now , this workshop helps to design the corresponding instructions using PC, Fetch unit, Decode units, ALU, Register read, register write and this leads to adding more instructions and a pipelined structure to give better performance , add certain valids to perform better clock gating saving us power thus giving a very good design.
-   Before adding the pipelined logic the output was present at 106 cycles , after adding the pipelined logic and taking care of the read/write hazard and saving on the writes, we get the same output at nearly 40 cycles which is a huge save.


Saved projects: multiplication:

Combinational logic: Lab exercise: New URL after Cloning:
https://myth3.makerchip.com/sandbox/0o2fXh7Lq/0vghElk

counter:
https://myth3.makerchip.com/sandbox/0o2fXh7Lq/0y8h73j

pipelined counts/mux.
https://myth3.makerchip.com/sandbox/0o2fXh7Lq/0vghElk#

compute pipeline:
https://myth3.makerchip.com/sandbox/0o2fXh7Lq/0GZhB9V

2 cycle counter Lab - no valid 
https://myth3.makerchip.com/sandbox/0o2fXh7Lq/0P1h0n8

2 cycle counter - with valid
https://myth3.makerchip.com/sandbox/0o2fXh7Lq/0Q1hXLO

Validity : 
https://myth3.makerchip.com/sandbox/0o2fXh7Lq/0k5hk2Y

Day 4 :  Implementation Plan for RISC - V 
	1. Program Counter:
		a. Increment on 4 count as d4 bytes increment happens in the PC.
		b. Start with 0 after reset.
		c. URL: https://myth3.makerchip.com/sandbox/0o2fXh7Lq/0nZhX93
    
	2. Fetch unit:
  In the Fetch part , the imem block is designed first.
  -   This included connecting the imem_rd block to the PC and the $instr is the data that is present in the index that PC tells and which corresponds to the RD block.
  -   So, the imem_addr corresponds to the PC index 3+1:2 and $instr is the 31:0 data which is present in that index of the read block.
  -   this transaction happens when the read enable is high.
   
  3. Fetch  continued:
   - Here after this instruction, the decode logic can be introduced.
   - The snapshots of the simulations after each stages are stored as snapshots as i could not paste the pic here.
   -  This definition of $instr is very important because the whole CPU instruction, fetch, decoding , ALU works on this instruction . (basically the ASM instructions are pointed here.)
  
  4. Decode Unit:
  - Here the intruction types are decoded . As a first step: The instruction types IRBSJU are decoded and assigned with decoded according to the last 5 bits from $instr[2:6] 
  - DECODING IMMEDIATE TYPES:
  -   Now , we create a $imm signal from the mux of whether it is a IRSBJU instruction. 
  - DECODING BASED ON INSTRUCTION TYPE :
  - IN RISC V , there are funct7,funct3,rs1,rs2,rd,rd,opcode are the differnt fields in the instructions and we define the instructions based on its position.
  - Then, the individual instrcutions are decoded based on the RISC-V spec on the different instructions like ADD, ADDI, LW,SW,BLE etc.,
  
  5. REGISTER FILE READ:
  - Here, the design gives 2 reads and 1 write per cycle.
  - The read block is connected with rs1 and rs2 registers defined above based on the read enables.
 
 From the Decoder unit , the design is present at the @1 level of Transaction of the pipeline.
   - Now the read data output port of this unit goes in to the ALU.
  
  6. ALU:
   - Here , the result is the output and the inputs are the read data1 and read_data2 from the register read block. The ALU operates on these read data.
   - The Src1_value and src2_value is the input to ALU.
   - The result depends on the type of the instruction that we defined , if it is add , it implies the src1_value is to be added with the immediate value that gets assigned along with this instruction.
   - this is fed to the Register Write block .
   - 
