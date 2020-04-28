 ---------------------------------------------------------------------------------------------------
--
-- Title       : SquareWave
-- Design      : WORK
-- Author      : Man Rares
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : SquareWave.vhd
-- Generated   : Mon Apr 27 15:00:42 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--																																																	 
-- Description : 
--
---------------------------------------------------------------------------------------------------			 
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;  

entity SquareWave is
	port (ClkIn, Reset, enable: in std_logic;
		  ClkOut: inout std_logic;
		  DataOut: out std_logic_vector (7 downto 0));	   
end SquareWave;

architecture SqWv of SquareWave is
	signal counter: integer:=1;
	signal tmp: std_logic:='0';
	signal count :std_logic_vector (7 downto 0) := "10010100";
    signal linear_feedback :std_logic;
begin
	process(ClkIn)
	begin
		if(Reset='1') then
			counter <= 1;
			tmp <= '0';
		elsif rising_edge(ClkIn) then
			counter<=counter+1;
			if(counter = 2) then
				tmp <= NOT tmp;
				counter <= 1;
			end if;
		end if;
		ClkOut <= tmp;
	end process;
	process(ClkOut, Reset)
	begin
		linear_feedback <= count(6) xor count(2);
		if (Reset = '1') then
            count <= "10010100";
        elsif (rising_edge(ClkOut)) then
            if (enable = '1') then
                count <= (count(6) & count(5) & count(4) & count(3) & count(2) & count(1) & count(0) & linear_feedback);
            end if;
        end if;
		DataOut <= count;
    end process;
		
end SqWv;