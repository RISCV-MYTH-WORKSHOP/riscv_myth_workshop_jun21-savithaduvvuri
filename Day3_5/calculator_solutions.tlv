\m4_TLV_version 1d: tl-x.org
\SV
   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
   
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/bd1f186fde018ff9e3fd80597b7397a1c862cf15/tlv_lib/calculator_shell_lib.tlv'])

\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)

\TLV
   |calc
     @0
         $reset = *reset;
         
         
         //Assigning default value to propagate X .
         
      @1
         $val1[31:0] = >>2$out;
         $val2[3:0] = $rand2[3:0];
         $default = 'x;
         //1 bit counter that generates valid.
         $valid = $reset ? 0 :  (>>1$valid + 1);
      @2
         
         
         
         //~valid ORing with Reset.
         $reset_valid = ~$valid | $reset;
         //MUX @2
         $out[31:0] = $reset_valid ? 4'h0 : ($op[1:0] == 2'b00)? ($val1 + $val2) : ($op[1:0] == 2'b01) ? (($val1 > $val2) ? ($val1 - $val2) : ($val2 - $val1)): ($op[1:0] == 2'b10) ? ($val1 * $val2) : ($op[1:0] == 2'b11) ? ($val1 / $val2): $default; 
         
         

   //m4+cal_viz(@3) // Arg: Pipeline stage represented by viz, should be atleast equal to last stage of CALCULATOR logic.

   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   

\SV
   endmodule
