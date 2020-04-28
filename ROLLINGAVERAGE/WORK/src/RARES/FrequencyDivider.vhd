---------------------------------------------------------------------------------------------------
--
-- Title       : FrequencyDivider
-- Design      : WORK
-- Author      : Man Rares
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : FrequencyDivider.vhd
-- Generated   : Mon Apr 27 13:20:00 2020
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

entity FrequencyDivider is
	port (SysClk, Reset: in std_logic;
	      DataClk: out std_logic);	   
end FrequencyDivider;

architecture FreqDiv of FrequencyDivider is
	signal count: integer:=1;
	signal tmp: std_logic:='0';
begin
	process(SysClk, Reset)
	begin
		if(Reset='1') then
			count <= 1;
			tmp <= '0';
		elsif rising_edge(SysClk) then
			count<=count+1;
			if(count = 25000000) then
				tmp <= NOT tmp;
				count <= 1;
			end if;
		end if;
		DataClk <= tmp;
	end process;
end FreqDiv;