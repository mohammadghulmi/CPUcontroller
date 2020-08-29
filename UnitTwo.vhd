----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:53:43 07/02/2019 
-- Design Name: 
-- Module Name:    UnitTwo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UnitTwo is
    Port ( Br_Code : in  STD_LOGIC_VECTOR (2 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           RAM_MUX : out  STD_LOGIC; 
           PC_INC : out  STD_LOGIC;
           PC_LOAD : out  STD_LOGIC; -- low
           PC_RESET : out  STD_LOGIC;
           A_WR : out  STD_LOGIC;
           IR_WR : out  STD_LOGIC;
           FLAG_WR : out  STD_LOGIC;
           MDR_WR : out  STD_LOGIC;
           ALU_EN : out  STD_LOGIC; -- low
           RAM_RD : out  STD_LOGIC; -- low 
           RAM_WR : out  STD_LOGIC; -- low
           NOW_STATE : out  STD_LOGIC_VECTOR (3 downto 0));
end UnitTwo;

architecture Behavioral of UnitTwo is

TYPE STATE is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10); 
	signal Current_State : STATE := S0;
	signal Next_State : STATE;
	signal RAM_MUX_S , PC_INC_S , PC_RESET_S , A_WR_S , IR_WR_S , FLAG_WR_S , 
				MDR_WR_S : STD_LOGIC := '0';
	signal PC_LOAD_S , ALU_EN_S , RAM_RD_S , RAM_WR_S : STD_LOGIC := '1';
	SIGNAL NOW_STATE_S : STD_LOGIC_VECTOR (3 DOWNTO 0) ;
	
begin
CLK_PROC : process(clk,reset) 
	begin 
		if(reset = '1') then 
			PC_RESET_S <= '1';
			Current_State <= S0;
		elsif (clk' event and clk = '0') then 
			PC_RESET_S <= '0';
			Current_State <= Next_State;
		end if ;
	end process;

OUTPUT_DEC : process(Current_State , clk) 
	begin 
		if(Current_State = S0) then 
			PC_INC_S 	<= '0';
			PC_LOAD_S <= '1';			
			IR_WR_S	<= '1' AND CLK;
			RAM_MUX_S <= '1'; 
			RAM_RD_S 	<= '1';  
			RAM_WR_S 	<= '1';
			MDR_WR_S 	<= '0';			
			A_WR_S		<= '0';
			FLAG_WR_S <= '0';
			ALU_EN_S 	<= '0';			
			NOW_STATE_S <= "0000";
		
		elsif (Current_State = S1) then 
			PC_INC_S 	<= '1';
			PC_LOAD_S <= '1';
			IR_WR_S 	<= '0';
			RAM_MUX_S <= '1';
			RAM_RD_S 	<= '0'; 
			RAM_WR_S 	<= '1';
			MDR_WR_S 	<= '1' AND CLK;
			A_WR_S		<= '0';			
			FLAG_WR_S <= '0';			
			ALU_EN_S 	<= '1'; 			
			NOW_STATE_S <= "0001";
			
		elsif (Current_State = S2) then			 
			PC_INC_S 	<= '0';
			PC_LOAD_S <= '1';
			IR_WR_S 	<= '0';	
			RAM_MUX_S <= '1';
			RAM_RD_S 	<= '1'; 
			RAM_WR_S 	<= '1';	
			MDR_WR_S 	<= '0';			
			A_WR_S		<= '1' AND CLK;			
			FLAG_WR_S <= '1' AND CLK;			
			ALU_EN_S 	<= '0'; 			
			NOW_STATE_S <= "0010";
		
		elsif (Current_State = S3) then			
			PC_INC_S 	<= '0';
			PC_LOAD_S <= '1'; 
			IR_WR_S 	<= '0';
			RAM_MUX_S <= '1';
			RAM_RD_S 	<= '0'; 
			RAM_WR_S 	<= '0';
			MDR_WR_S 	<= '0';			
			A_WR_S		<= '0';			
			FLAG_WR_S <= '1' AND CLK;			
			ALU_EN_S 	<= '0'; 			
			NOW_STATE_S <= "0011";
		
		elsif (Current_State = S4) then			
			PC_INC_S	<= '0';
			PC_LOAD_S <= '0';
			IR_WR_S 	<= '0';	
			RAM_MUX_S <= '1'; 
			RAM_RD_S 	<= '0'; 
			RAM_WR_S 	<= '1';
			MDR_WR_S 	<= '0';
			A_WR_S		<= '0';			
			FLAG_WR_S <= '0';			
			ALU_EN_S 	<= '1'; 			
			NOW_STATE_S <= "0100";
				
		elsif (Current_State = S5) then			 
			PC_INC_S		<= '0';
			PC_LOAD_S	<= '1'; 
			IR_WR_S	 	<= '0';
			RAM_MUX_S	<= '0';
			RAM_RD_S 	<= '0'; 
			RAM_WR_S 	<= '1';
			MDR_WR_S 	<= '1' AND CLK;
			A_WR_S		<= '0';			
			FLAG_WR_S <= '0';			
			ALU_EN_S 	<= '1'; 			
			NOW_STATE_S <= "0101";
				
		elsif (Current_State = S6) then			
			PC_INC_S 	<= '0';
			PC_LOAD_S <= '1';
			IR_WR_S 	<= '0';			
			RAM_MUX_S <= '1';
			RAM_RD_S 	<= '1'; 
			RAM_WR_S 	<= '1';		
			MDR_WR_S 	<= '0';			
			A_WR_S		<= '1' AND CLK;			
			FLAG_WR_S <= '1' AND CLK;			
			ALU_EN_S 	<= '0'; 			
			NOW_STATE_S <= "0110";
			
		elsif (Current_State = S7) then			
			PC_INC_S 	<= '0';
			PC_LOAD_S <= '1';
			IR_WR_S 	<= '0';
			RAM_MUX_S <= '0'; 
			RAM_RD_S 	<= '1'; 
			RAM_WR_S 	<= '1';
			MDR_WR_S 	<= '0';
			A_WR_S		<= '0';			
			FLAG_WR_S <= '0';			
			ALU_EN_S 	<= '0'; 			
			NOW_STATE_S <= "0111";
				
		elsif (Current_State = S8) then			
			PC_INC_S 	<= '0';
			PC_LOAD_S <= '1';
			IR_WR_S 	<= '0';		
			RAM_MUX_S <= '0'; 	
			RAM_RD_S 	<= '1'; 
			RAM_WR_S 	<= '0';
			MDR_WR_S 	<= '0';
			A_WR_S		<= '0';			
			FLAG_WR_S <= '0';			
			ALU_EN_S 	<= '0'; 			
			NOW_STATE_S <= "1000";
			
		elsif (Current_State = S9) then			
			PC_INC_S 	<= '0';
			PC_LOAD_S <= '1';
			IR_WR_S 	<= '0';
			RAM_MUX_S <= '0';
			RAM_RD_S 	<= '1'; 
			RAM_WR_S 	<= '1';
			MDR_WR_S 	<= '0';			
			A_WR_S		<= '0';			
			FLAG_WR_S <= '0';			
			ALU_EN_S 	<= '0'; 			
			NOW_STATE_S <= "1001";
		
		
			
		else			
			PC_INC_S 	<= '0';
			PC_LOAD_S <= '1';
			IR_WR_S 	<= '0';
			RAM_MUX_S <= '1'; 
			RAM_RD_S 	<= '1'; 
			RAM_WR_S 	<= '1';
			MDR_WR_S 	<= '0';
			A_WR_S		<= '0';			
			FLAG_WR_S <= '0';			
			ALU_EN_S 	<= '1'; 			
			NOW_STATE_S <= "0000";
		end if;
	end process;
	PC_INC 	<= PC_INC_S;
	PC_LOAD 	<= PC_LOAD_S;
	IR_WR		<= IR_WR_S;
	RAM_MUX 	<= not RAM_MUX_S;
	RAM_RD 	<= RAM_RD_S;
	RAM_WR 	<= RAM_WR_S;	
	MDR_WR 	<= MDR_WR_S ;
	A_WR		<= A_WR_S;	
	FLAG_WR 	<= FLAG_WR_S;	
	ALU_EN 	<= ALU_EN_S;
	PC_RESET <= PC_RESET_S;	
	NOW_STATE <= NOW_STATE_S; 
 
 NEXT_STATE_PROC : process(Current_State , Br_Code) 
	begin 
		case (Current_State) is
			when S0 =>
				Next_State <= S1;
			when S1 =>
				if	(BR_CODE = "000") then
					Next_State <= S0;
				elsif	(BR_CODE = "001") then
					Next_State <= S2;
				elsif	(BR_CODE = "010") then
					Next_State <= S3;
				elsif	(BR_CODE = "011") then
					Next_State <= S4;
				elsif	(BR_CODE = "100") then
					Next_State <= S5;
				elsif	(BR_CODE = "101") then
					Next_State <= S7;
				
				else
					Next_State <= S0;
				end if;
         when S2	=>
            Next_State <= S0;
         when S3 	=>
				Next_State <= S0;
			when S4 	=>
				Next_State <= S0;
			when S5 	=>
				Next_State <= S6;
			when S6 	=>
				Next_State <= S0;
			when S7 	=>
				Next_State <= S8;
         when S8 	=>
				Next_State <= S9;
			when S9 	=>
				Next_State <= S0;
			
         when others =>
				Next_State <= S0;
      end case;      
	end process;
end Behavioral;