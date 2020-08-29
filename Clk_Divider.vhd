----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:57:27 07/01/2019 
-- Design Name: 
-- Module Name:    Clk_Divider - Behavioral 
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

entity Clk_Divider is
    Port ( Clk_in : in  STD_LOGIC;
           Clk_out : out  STD_LOGIC);
end Clk_Divider;

architecture Behavioral of Clk_Divider is
Signal Counter : integer RANGE 0 to 50000000 := 0;
Signal Clk_out_value : std_logic := '0';
begin
process (Clk_in) 
	begin  
		if(Clk_in' event and Clk_in = '1') then
			Counter <= Counter + 1;
			if(Counter = 50000000) then 
				Clk_out_value <= not Clk_out_value;
				Counter <= 0;
			end if;
		end if;
	end process;
	Clk_out <= Clk_out_value;
end Behavioral;

