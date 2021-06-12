# RISC-V_MYTH_Workshop

For students of "Microprocessor for You in Thirty Hours" Workshop, offered by for VLSI System Design (VSD) and Redwood EDA, find here accompanying live info and links.

Refer to README at [stevehoover/RISC-V_MYTH_Workshop](https://github.com/stevehoover/RISC-V_MYTH_Workshop) for lab instructions.

Add your codes in the [calculator_solutions.tlv](calculator_solutions.tlv) and [risc-v_solutions.tlv](risc-v_solutions.tlv) files and **keep committing** to your repository after every lab.

//Added my LAB solution for the combo logic:: 
//Some points to be noted: 
//Regarding the test bench: how do we make sure that all the combinations are hit. 
//$valid can be a non-deterministic signal but is the simulation a SAT solver?
//division of 0/0 gives me 0, should not it be NaN.
//How do we change the data types for example, if i want the floating point number , i might need real data type. How can i change to that. 

Recording the answers also here: for future reference:: Thanks to Steve for helping/explaining me with these answers::
There's no guarantee that your random stimulus hits all the cases that matter. For this, the industry does coverage analysis and more-sophisticated test benches. No SAT solver.
The division result is a vector of bits represented in the waveform viewer as a binary value. There is no encoding representing NaN. Presumably the behavior defined by the Verilog language spec is that 0/0 = 0.
There's a currently-awkward syntax for that... but let's not go there at this point.

//Learnings: Day 3 Sequential Logic.
For the counter::
When non blocking statement was not used, the counter did not start , though i was giving the >>1 $cnt. 
In Verilog, we normally use always_comb and put a flop (with non-blocking assignment) with $cnt_next and $cnt. 
The non-blocking assignment makes the difference here.
