module traffic_light (
    input  clk,
    input  rst,
    input  pass,
    output reg R,
    output reg G,
    output reg Y
);

//write your code here
    reg [1:0]state; 
    reg [34:0]counter; 
    parameter GREEN = 2'd0;
    parameter IDLE = 2'd1;
    parameter YELLOW = 2'd2;
    parameter RED = 2'd3;
    always @(posedge clk or posedge rst)begin
        counter <= counter + 1;
        if(rst)begin
            state <= GREEN;
            counter <= 1;
            end
        else if(pass && counter > 511)begin
            state <= GREEN;
            counter <= 1;
            end
        else begin
                
            if(counter < 512)begin
                state <= GREEN;
            end
            else if(counter >= 512 && counter <= 575)begin
                state <= IDLE;
            end
            else if(counter >= 576 && counter <= 639)begin
                state <= GREEN;
            end
            else if(counter >= 640 && counter <= 703)begin
                state <= IDLE;
            end
            else if(counter >= 704 && counter <= 767)begin
                state <= GREEN;
            end
            else if(counter >= 768 && counter <= 1023)begin
                state <= YELLOW;
            end
            else if(counter >= 1024 && counter <= 1535)begin
                state <= RED;
            end
            else begin
                counter <= 1;
                state <= GREEN;
            end
        end
    end
    
    always @(*)begin
        case(state)
            IDLE : begin
                R = 0;
                Y = 0;
                G = 0;
            end
            GREEN : begin
                R = 0;
                Y = 0;
                G = 1;
            end
            YELLOW : begin
                R = 0;
                Y = 1;
                G = 0;
            end
            RED : begin
                R = 1;
                Y = 0;
                G = 0;
            end
            
        endcase
    end
endmodule
