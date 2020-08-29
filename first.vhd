----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:09:58 07/01/2019 
-- Design Name: 
-- Module Name:    first - Behavioral 
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

entity first is
    Port ( Opcode : in  STD_LOGIC_VECTOR (4 downto 0);
           C : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Code : out  STD_LOGIC_VECTOR (2 downto 0);
           ALU_Op : out  STD_LOGIC_VECTOR (3 downto 0);
           ALU_Mux : out  STD_LOGIC);
end first;

architecture Behavioral of first is

begin
process (Opcode , C , Z , D) 
	begin 
		case (Opcode) is 

		-- MOVLA 
		when "00000" =>
			ALU_Op <= "1000";
			Code <= "001";
			ALU_Mux <= '0';
		-- ADDLA
		when "00111" =>
			ALU_Op <= "0000";
			Code <= "001";
			ALU_Mux <= '0';
		-- SUBLA
		when "01000" =>
			ALU_Op <= "0001";
			Code <= "001";
			ALU_Mux <= '0';
		-- ANDLA
		when "01011" => 
			ALU_Op <= "0100";
			Code <= "001";
			ALU_Mux <= '0';
		-- ORLA
		when "01101" => 
			ALU_Op <= "0101";
			Code <= "001";
			ALU_Mux <= '0';
		-- XORLA
		when "01111" => 
			ALU_Op <= "0110";
			Code <= "001";
			ALU_Mux <= '0';
		-- MOVRA 
			when "00001" =>
				ALU_Op <= "1000";
				Code <= "001";
				ALU_Mux <= '1';
		-- ADDRA 
			when "01001" =>
				ALU_Op <= "0000";
				ALU_Mux <= '1';
				if(D = '0') then 
					Code <= "001";
				else if (D = '1') then
					Code <= "010";
				end if;
		-- SUBRA 
			when "01010" =>
				ALU_Op <= "0001";
				ALU_Mux <= '1';
				if(D = '0') then 
					Code <= "001";
				else if (D = '1') then
					Code <= "010";
				end if;
		-- ANDRA 
			when "01100" =>
				ALU_Op <= "0100";
				ALU_Mux <= '1';
				if(D = '0') then 
					Code <= "001";
				else if (D = '1') then
					Code <= "010";
				end if;
		-- ORRA 
			when "01110" =>
				ALU_Op <= "0101";
				ALU_Mux <= '1';
				if(D = '0') then 
					Code <= "001";
				else if (D = '1') then
					Code <= "010";
				end if;
		-- XORRA 
			when "10000" =>
				ALU_Op <= "0110";
				ALU_Mux <= '1';
				if(D = '0') then 
					Code <= "001";
				else if (D = '1') then
					Code <= "010";
				end if;
	end process;
end Behavioral;

