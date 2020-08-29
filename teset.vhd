--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:15:33 07/10/2019
-- Design Name:   
-- Module Name:   D:/VHDL/CPU_Controller/teset.vhd
-- Project Name:  CPU_Controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY teset IS
END teset;
 
ARCHITECTURE behavior OF teset IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main
    PORT(
         clk : IN  std_logic;
         OPCODE : IN  std_logic_vector(4 downto 0);
         C : IN  std_logic;
         Z : IN  std_logic;
         D : IN  std_logic;
         RESET : IN  std_logic;
         ALU_OP : OUT  std_logic_vector(3 downto 0);
         ALU_MUX : OUT  std_logic;
         RAM_MUX : OUT  std_logic;
         PC_INC : OUT  std_logic;
         PC_LOAD : OUT  std_logic;
         PC_RESET : OUT  std_logic;
         A_WR : OUT  std_logic;
         IR_WR : OUT  std_logic;
         FLAG_WR : OUT  std_logic;
         MDR_WR : OUT  std_logic;
         ALU_EN : OUT  std_logic;
         RAM_RD : OUT  std_logic;
         RAM_WR : OUT  std_logic;
         NOW_STATE : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal OPCODE : std_logic_vector(4 downto 0) := (others => '0');
   signal C : std_logic := '0';
   signal Z : std_logic := '0';
   signal D : std_logic := '0';
   signal RESET : std_logic := '0';

 	--Outputs
   signal ALU_OP : std_logic_vector(3 downto 0);
   signal ALU_MUX : std_logic;
   signal RAM_MUX : std_logic;
   signal PC_INC : std_logic;
   signal PC_LOAD : std_logic;
   signal PC_RESET : std_logic;
   signal A_WR : std_logic;
   signal IR_WR : std_logic;
   signal FLAG_WR : std_logic;
   signal MDR_WR : std_logic;
   signal ALU_EN : std_logic;
   signal RAM_RD : std_logic;
   signal RAM_WR : std_logic;
   signal NOW_STATE : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main PORT MAP (
          clk => clk,
          OPCODE => OPCODE,
          C => C,
          Z => Z,
          D => D,
          RESET => RESET,
          ALU_OP => ALU_OP,
          ALU_MUX => ALU_MUX,
          RAM_MUX => RAM_MUX,
          PC_INC => PC_INC,
          PC_LOAD => PC_LOAD,
          PC_RESET => PC_RESET,
          A_WR => A_WR,
          IR_WR => IR_WR,
          FLAG_WR => FLAG_WR,
          MDR_WR => MDR_WR,
          ALU_EN => ALU_EN,
          RAM_RD => RAM_RD,
          RAM_WR => RAM_WR,
          NOW_STATE => NOW_STATE
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--group A
OPCODE <= "00111"; 
		C<= '0';
		Z<= '0';
		D <= '0';
      wait for clk_period*10;
		
OPCODE <= "10110"; 
		C<= '0';
		Z<= '0';
		D <= '1';
		wait for clk_period*10;
--group B
OPCODE <= "01001"; 
		C<= '0';
		Z<= '0';
		D <= '1';
		wait for clk_period*10;
OPCODE <= "10110"; 
		C<= '0';
		Z<= '0';
		D <= '1';
		wait for clk_period*10;
--group C
OPCODE <= "10110"; 
		C<= '0';
		Z<= '1';
		D <= '1';
		wait for clk_period*10;
OPCODE <= "10110"; 
		C<= '0';
		Z<= '0';
		D <= '1';
		wait for clk_period*10;
--group D
OPCODE <= "00011"; 
		C<= '0';
		Z<= '0';
		D <= '0';
		wait for clk_period*10;
OPCODE <= "10110"; 
		C<= '0';
		Z<= '0';
		D <= '1';
		wait for clk_period*10;
--group E
OPCODE <= "00100"; 
		C<= '0';
		Z<= '0';
		D <= '1';
		wait for clk_period*10;



      -- insert stimulus here 

      wait;
   end process;

END;
