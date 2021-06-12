\m4_TLV_version 1d: tl-x.org
\SV
//Calculator labs solutions here
//Counter solution:
m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   //4 bit counter that counts till 15 and becomes 0 after 15 and 0 at reset.
    $cnt[3:0] <= $reset ? 0 : ($cnt == 4'hF) ? 0 : (>>1$cnt + 1);

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
