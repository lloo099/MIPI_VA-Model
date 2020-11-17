module sar(
  input wire CLKS,
  input wire D_GND,
  input wire valid,
  input wire outn,
  output wire CLK10,
  output wire CLK9,
  output wire CLK8,  
  output wire CLK7,
  output wire CLK6,
  output wire CLK5,
  output wire CLK4,
  output wire CLK3,
  output wire CLK2,
  output wire CLK1,   
  output wire CLKC,
  output wire D9,
  output wire D8,  
  output wire D7,
  output wire D6,
  output wire D5,
  output wire D4,
  output wire D3,
  output wire D2,
  output wire D1,   
  output wire D0
  );
  
  wire [20:1] q_b;
  reg rstn;
    
  dff1 x10(.d(CLK9), .q(CLK10), .q_b(q_b[10]), .clk(valid), .rst(CLKS));
  dff1 x9(.d(CLK8), .q(CLK9), .q_b(q_b[9]), .clk(valid), .rst(CLKS));
  dff1 x8(.d(CLK7), .q(CLK8), .q_b(q_b[8]), .clk(valid), .rst(CLKS));
  dff1 x7(.d(CLK6), .q(CLK7), .q_b(q_b[7]), .clk(valid), .rst(CLKS));
  dff1 x6(.d(CLK5), .q(CLK6), .q_b(q_b[6]), .clk(valid), .rst(CLKS));
  dff1 x5(.d(CLK4), .q(CLK5), .q_b(q_b[5]), .clk(valid), .rst(CLKS));
  dff1 x4(.d(CLK3), .q(CLK4), .q_b(q_b[4]), .clk(valid), .rst(CLKS));
  dff1 x3(.d(CLK2), .q(CLK3), .q_b(q_b[3]), .clk(valid), .rst(CLKS));
  dff1 x2(.d(CLK1), .q(CLK2), .q_b(q_b[2]), .clk(valid), .rst(CLKS));
  dff1 x1(.d(D_GND), .q(CLK1), .q_b(q_b[1]), .clk(valid), .rst(CLKS));
  
  assign CLKC = (q_b[10] | valid | CLKS);
  
  dff1 x20(.d(outn), .q(D9), .q_b(q_b[20]), .clk(CLK10), .rst(rstn));
  dff1 x19(.d(outn), .q(D8), .q_b(q_b[19]), .clk(CLK9), .rst(rstn));
  dff1 x18(.d(outn), .q(D7), .q_b(q_b[18]), .clk(CLK8), .rst(rstn));
  dff1 x17(.d(outn), .q(D6), .q_b(q_b[17]), .clk(CLK7), .rst(rstn));
  dff1 x16(.d(outn), .q(D5), .q_b(q_b[16]), .clk(CLK6), .rst(rstn));
  dff1 x15(.d(outn), .q(D4), .q_b(q_b[15]), .clk(CLK5), .rst(rstn));
  dff1 x14(.d(outn), .q(D3), .q_b(q_b[14]), .clk(CLK4), .rst(rstn));
  dff1 x13(.d(outn), .q(D2), .q_b(q_b[13]), .clk(CLK3), .rst(rstn));
  dff1 x12(.d(outn), .q(D1), .q_b(q_b[12]), .clk(CLK2), .rst(rstn));
  dff1 x11(.d(outn), .q(D0), .q_b(q_b[11]), .clk(CLK1), .rst(rstn));

endmodule
  