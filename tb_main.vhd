--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:03:19 12/04/2017
-- Design Name:   
-- Module Name:   D:/FPGA/OnTheFlyPatcher/tb_main.vhd
-- Project Name:  OnTheFlyPatcher
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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
 
ENTITY tb_main IS
END tb_main;
 
ARCHITECTURE behavior OF tb_main IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         OE : IN  std_logic;
         DQ : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';
   signal OE : std_logic := '0';

	--BiDirs
   signal DQ : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          RST => RST,
          CLK => CLK,
          OE => OE,
          DQ => DQ
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		RST <= '0';
		OE <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		RST <= '1';
		DQ <= X"00";
		wait for 100 ns;
		
		OE <= '0';
		wait for 10 ns;
		DQ <= X"06";
		wait for 100 ns;
		OE <= '1';
		wait for 100 ns;
		
		OE <= '0';
		wait for 10 ns;
		DQ <= X"09";
		wait for 100 ns;
		OE <= '1';
		wait for 100 ns;
		
		OE <= '0';
		wait for 10 ns;
		DQ <= X"FE";
		wait for 100 ns;
		OE <= '1';
		wait for 100 ns;
		
		OE <= '0';
		wait for 10 ns;
		DQ <= X"09";
		wait for 100 ns;
		OE <= '1';
		wait for 100 ns;
		
		OE <= '0';
		wait for 10 ns;
		DQ <= X"09";
		wait for 100 ns;
		OE <= '1';
		
      wait;
   end process;

END;
