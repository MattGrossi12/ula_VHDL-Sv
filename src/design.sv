/*----------------------------------------------//

	Wrapper de simulação mista SV + VHDL
   
//----------------------------------------------*/

module design_wrapper #(
	parameter 	WIDTH = 8,
  				T_WID = WIDTH - 1
)(
  input  logic [T_WID:0] a, b,
  output logic [T_WID:0] s_o,
  output logic cout
);

adder_block dut_vhdl (.*);

endmodule