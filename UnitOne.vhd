----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:58:04 07/02/2019 
-- Design Name: 
-- Module Name:    UnitOne - Behavioral 
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

entity UnitOne is
    Port ( OpCode : in  STD_LOGIC_VECTOR (4 downto 0);
           C : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Br_Code : out  STD_LOGIC_VECTOR (2 downto 0);
           ALU_Op : out  STD_LOGIC_VECTOR (3 downto 0);
           ALU_Mux : out  STD_LOGIC);
end UnitOne;

architecture Behavioral of UnitOne is

begin
	process(OpCode , D , C , Z) 
	begin 
		case (OpCode) is 
			-- Group A + B
			
			--MOVLA 
			when "00000" => 
				ALU_Op <= "1000";
				Br_Code <= "001";
				ALU_Mux <= '0';
			
			--ADDLA
			when "00111" =>
				ALU_Op <= "0000";
				Br_Code <= "001";
				ALU_Mux <= '0';
				
			--SUBLA
			when "01000" => 
				ALU_Op <= "0001";
				Br_Code <= "001";
				ALU_Mux <= '0';
			
			--ANDLA 
			when "01011" => 
				ALU_Op <= "0100";
				Br_Code <= "001";
				ALU_Mux <= '0';
			
			--ORLA
			when "01101" =>
				ALU_Op <= "0101";
				Br_Code <= "001";
				ALU_Mux <= '0';
				
			--XORLA
			when "01111" =>
				ALU_Op <= "0110";
				Br_Code <= "001";
				ALU_Mux <= '0';
			
			--MOVRA 
			when "00001" =>
				ALU_Op <= "1000";
				Br_Code <= "001";
				ALU_Mux <= '1';
			
			--ADDAR
			when "01001" => 
				ALU_Op <= "0000";
				ALU_Mux <= '1';
				if(D = '0') then 
					Br_Code <= "001";
				elsif (D = '1') then 
					Br_Code <= "010";
				end if;
				
			--SUBAR
			when "01010" => 
				ALU_Op <= "0010";
				ALU_Mux <= '1';
				if(D = '0') then 
					Br_Code <= "001";
				elsif (D = '1') then 
					Br_Code <= "010";
				end if;
				
			--ANDAR
			when "01100" => 
				ALU_Op <= "0100";
				ALU_Mux <= '1';
				if(D = '0') then 
					Br_Code <= "001";
				elsif (D = '1') then 
					Br_Code <= "010";
				end if;
				
				
			--ORAR
			when "01110" => 
				ALU_Op <= "0101";
				ALU_Mux <= '1';
				if(D = '0') then 
					Br_Code <= "001";
				elsif (D = '1') then 
					Br_Code <= "010";
				end if;
				
			--XORAR
			when "10000" => 
				ALU_Op <= "0110";
				ALU_Mux <= '1';
				if(D = '0') then 
					Br_Code <= "001";
				elsif (D = '1') then 
					Br_Code <= "010";
				end if;
				
		-- Group B 
			
			--MOVAR
				when "00010" => 
					ALU_Op <= "1001";
					Br_Code <= "010";
					ALU_Mux <= '1';
				
				--ROLC
				when "10010" => 
					ALU_Op <= "1010";
					Br_Code <= "010";
					ALU_Mux <= '1';
					
				--ROLC
				when "10011" => 
					ALU_Op <= "1011";
					Br_Code <= "010";
					ALU_Mux <= '1';
					
				-- INCR
				when "00101" =>
					ALU_Op <= "0010";
					Br_Code <= "010";
					ALU_Mux <= '1';
			
				-- DECR
				when "00110" =>
					ALU_Op <= "0011";
					Br_Code <= "010";
					ALU_Mux <= '1';
					
				--NOTR
				when "10001" => 
					ALU_Op <= "0111";
					Br_Code <= "010";
					ALU_Mux <= '1';
				
			-- Group C 
				
				--JMP
				when "10101" =>
					ALU_Op <= "0000";
					Br_Code <= "011";
					ALU_Mux <= '0';
				
				--JZ
				when "10110" => 
				ALU_Op <= "0000";
				ALU_Mux <= '0';
				if (Z = '0') then
					Br_Code <= "000";
				elsif(Z = '1') THEN
					Br_Code <= "011";
				end if;	
				
				--JNZ
				when "10111" => 
				ALU_Op <= "0000";
				ALU_Mux <= '0';
				if (Z = '0') then
					Br_Code <= "011";
				elsif(Z = '1') THEN
					Br_Code <= "000";
				end if;	
				
			--JC
			when "11000" => 
				ALU_Op <= "0000";
				ALU_Mux <= '0';
				if (C = '0') then
					Br_Code <= "000";
				elsif(C = '1') THEN
					Br_Code <= "011";
				end if;	
				
			--JNC
			when "11001" => 
				ALU_Op <= "0000";
				ALU_Mux <= '0';
				if (C = '0') then
					Br_Code <= "011";
				elsif(C = '1') THEN
					Br_Code <= "000";
				end if;	
				
		-- Group D
			
			--MOVIRA 
			when "00011" =>
				ALU_Op <= "1000";
				Br_Code <= "100";
				ALU_Mux <= '1';
				
		-- Group E 
		
			--MOVIAR 
			when "00100" =>
				ALU_Op <= "1001";
				Br_Code <= "101";
				ALU_Mux <= '1';
			
					
				when others => 
					ALU_Op <= "0000";
					Br_Code <= "000";
					ALU_Mux <= '0';
			end case;
		end process;
end Behavioral;

