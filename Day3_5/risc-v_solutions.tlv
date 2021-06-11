\m4_TLV_version 1d: tl-x.org
\SV
//RISC-V labs solutions here
 module top(input wire clk, input wire reset, input wire [31:0] cyc_cnt, output wire passed, output wire failed);    /* verilator lint_save */ /* verilator lint_off UNOPTFLAT */  bit [256:0] RW_rand_raw; bit [256+63:0] RW_rand_vect; pseudo_rand #(.WIDTH(257)) pseudo_rand (clk, reset, RW_rand_raw[256:0]); assign RW_rand_vect[256+63:0] = {RW_rand_raw[62:0], RW_rand_raw};  /* verilator lint_restore */  /* verilator lint_off WIDTH */ /* verilator lint_off UNOPTFLAT */   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   //mux to select whether to add , sub , diff, mul depending on respective sel value.
   //To reduce the complexity of the array.
   $val1[31:0] = $rand1[3:0];
   $val2[31:0] = $rand2[3:0];
   //Assigning the values:
   $sum[31:0]  = $val1 + $val2;
   $diff[31:0] = $val1 - $val2;
   $prod[31:0] = $val1 * $val2;
   $quot[31:0] = $val1 / $val2;
   $default = 'x;
   $out[31:0] = ($op[1:0] == 2'b00)? $sum[31:0] : ($op[1:0] == 2'b01) ? $diff[31:0] : ($op[1:0] == 2'b10) ? $prod[31:0] : ($op[1:0] == 2'b11) ? $quot[31:0]: $default; 
   

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
