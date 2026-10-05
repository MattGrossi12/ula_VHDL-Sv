module testbench;

  	parameter 	WIDTH = 8,
  				T_WID = WIDTH - 1;
  
logic [T_WID:0] a, b;
logic [T_WID:0] s_o;
logic cout;

int N = 10;

assign cout = s_o[WIDTH];
  
design_wrapper dut (.*);

task rd_sum;
    begin
        a = $random_range(0, 256);
        b = $random_range(0, 256);
        #10;
    end
endtask

task header;
    begin
        $display("+-----------------------------------------+");
        $display("|    A     |    B     | Cout |      S     |");
        $display("+-----------------------------------------+");
    end
endtask

task div; $display("+-----------------------------------------+"); endtask;
task footer; div(); header(); div(); endtask;

    initial 
      	begin
            footer();
            $monitor("| %08b | %08b |  %01b  |  %08b  |", a, b, cout, s_o);

            repeat(N) 
                begin
                    rd_sum;
                end

          #1;
          div();
          $finish;
    	end
  
endmodule