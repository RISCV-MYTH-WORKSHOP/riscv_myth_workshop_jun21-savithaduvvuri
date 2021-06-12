\m4_TLV_version 1d: tl-x.org
\SV
//Calculator labs solutions here
\TLV
   $reset = *reset;
   //mux to select whether to add , sub , diff, mul depending on respective sel value.
   //To reduce the complexity of the array.
   $val1[31:0] = >>1$out;
   $val2[3:0] = $rand2[3:0];
   //Assigning default value to propagate X .
   $default = 'x;
   $out[31:0] = $reset ? 4'h0 : ($op[1:0] == 2'b00)? ($val1 + $val2) : ($op[1:0] == 2'b01) ? (($val1 > $val2) ? ($val1 - $val2) : ($val2 - $val1)): ($op[1:0] == 2'b10) ? ($val1 * $val2) : ($op[1:0] == 2'b11) ? ($val1 / $val2): $default; 
   

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
