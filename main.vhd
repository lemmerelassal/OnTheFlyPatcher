----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Lemmer EL ASSAL
-- 
-- Create Date:    19:52:04 12/04/2017 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
    Port ( RST : in STD_LOGIC;
			  CLK : in  STD_LOGIC;
           OE : in  STD_LOGIC;
           DQ : inout  STD_LOGIC_VECTOR (7 downto 0));
end main;

architecture Behavioral of main is

signal oe_reg : std_logic_vector(2 downto 0);
signal state, n_state : integer;
signal i_dq : std_logic_vector(7 downto 0);
signal output_dq : std_logic;

begin

process(RST, CLK)
begin
	if RST = '0' then
		state <= 0;
		oe_reg <= "111";
	elsif rising_edge(CLK) then
		if oe_reg = "100" then
			state <= n_state;
		end if;
		oe_reg <= oe_reg(1 downto 0) & OE;
	end if;
end process;

process(state, oe_reg)
begin
	n_state <= state;
	output_dq <= '0';
		case state is
		
			when 0 =>
				if DQ = X"06" then
					n_state <= state + 1;
				end if;
			when 1 => 
				if DQ = X"09" then
					n_state <= state + 1;
				end if;
			when 2 =>
				output_dq <= '1';
				i_dq <= X"DE";
				n_state <= state + 1;
			when 3 => 
				output_dq <= '1';
				i_dq <= X"AD";
				n_state <= state + 1;
			when 4 =>
				output_dq <= '1';
				i_dq <= X"BE";
				n_state <= state + 1;
			when 5 =>
				output_dq <= '1';
				i_dq <= X"EF";
				n_state <= state + 1;
			when others =>
				n_state <= 0;
				
		end case;
end process;

DQ <= i_dq when output_dq = '1' else (others => 'Z');



end Behavioral;

