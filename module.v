module fivebitLock(input a, input reset, input clk, output reg l);
  parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100,
  S5 = 3'b101, S6 =3'b110;

  reg [2:0] state, next_state;
  wire [5:0] password = 6'b111000;

  always @(posedge clk or negedge reset) begin
    if (!reset)
      state <= S0;
    else
      state <= next_state;
  end

  
  always @(*) begin
    l = 0; 
    case (state)
      S0: begin
        if(a==password[5]) begin
          next_state=S1;
        end else begin
          next_state=S0;
        end
      end
      S1: begin
        if(a==password[4]) begin
          next_state=S2;
        end else begin
          next_state=S0;
        end
      end
      S2: begin
        if(a==password[3]) begin
          next_state=S3;
        end else begin
          next_state=S0;
        end
      end
      S3: begin
        if(a==password[2]) begin
          next_state=S4;
        end else begin
          next_state=S0;
        end
      end
      S4: begin
        if(a==password[1]) begin
          next_state=S5;
        end else begin
          next_state=S0;
        end
      end
      S5: begin
        next_state = (a == password[0]) ? S6 : S0;
        if (a == password[0])
          l = 1;
      end
      S6: next_state = S0;
      default: next_state = S0;
    endcase
  end
endmodule
