----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:12:29 07/03/2019 
-- Design Name: 
-- Module Name:    Main - Behavioral 
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

entity Main is
    Port ( clk : in  STD_LOGIC;
           OPCODE : in  STD_LOGIC_VECTOR (4 downto 0);
           C : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           D : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           ALU_OP : out  STD_LOGIC_VECTOR (3 downto 0);
           ALU_MUX : out  STD_LOGIC;
           RAM_MUX : out  STD_LOGIC;
           PC_INC : out  STD_LOGIC;
           PC_LOAD : out  STD_LOGIC;
           PC_RESET : out  STD_LOGIC;
           A_WR : out  STD_LOGIC;
           IR_WR : out  STD_LOGIC;
           FLAG_WR : out  STD_LOGIC;
           MDR_WR : out  STD_LOGIC;
           ALU_EN : out  STD_LOGIC;
           RAM_RD : out  STD_LOGIC;
           RAM_WR : out  STD_LOGIC;
           NOW_STATE : out  STD_LOGIC_VECTOR (3 downto 0));
end Main;

architecture Behavioral of Main is
--	SIGNAL CLK_OUT : STD_LOGIC;
	SIGNAL Br_Code_S : STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	COMPONENT UnitOne 
	PORT ( 
			  OpCode : in  STD_LOGIC_VECTOR (4 downto 0);
           C : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Br_Code : out  STD_LOGIC_VECTOR (2 downto 0);
           ALU_Op : out  STD_LOGIC_VECTOR (3 downto 0);
           ALU_Mux : out  STD_LOGIC);
	END COMPONENT;
	 
	COMPONENT UnitTwo is
    Port ( Br_Code : in  STD_LOGIC_VECTOR (2 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           RAM_MUX : out  STD_LOGIC; 
           PC_INC : out  STD_LOGIC;
           PC_LOAD : out  STD_LOGIC; 
           PC_RESET : out  STD_LOGIC;
           A_WR : out  STD_LOGIC;  
           IR_WR : out  STD_LOGIC;
           FLAG_WR : out  STD_LOGIC;
           MDR_WR : out  STD_LOGIC; 
           ALU_EN : out  STD_LOGIC;
           RAM_RD : out  STD_LOGIC;
           RAM_WR : out  STD_LOGIC;
           NOW_STATE : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;
COMPONENT Clk_Divider is
    Port ( Clk_in : in  STD_LOGIC;
           Clk_out : out  STD_LOGIC);
end COMPONENT;
begin
CLK_OUT_DIV : Clk_Divider PORT MAP (clk , CLK_OUT);
Unit_One : UnitOne port map (OPCODE,C,Z,D,Br_Code_S,ALU_OP,ALU_MUX);
Unit_Two : UnitTwo port map (Br_Code_S,CLK_OUT,RESET,RAM_MUX,PC_INC,PC_LOAD,PC_RESET,A_WR,IR_WR,FLAG_WR,MDR_WR,ALU_EN,RAM_RD,RAM_WR,NOW_STATE);
end Behavioral;

