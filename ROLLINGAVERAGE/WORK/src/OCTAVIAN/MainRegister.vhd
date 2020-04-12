---------------------------------------------------------------------------------------------------
--
-- Title       : MainRegister
-- Design      : Project
-- Author      : OctavianMatei
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : MainRegister.vhd
-- Generated   : Sun Apr 12 16:03:15 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {MainRegister} architecture {MainRegister}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_arith.all;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- This component is a register which stores up to 16 numbers, feeding the Adders with data
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
entity MainRegister is 
	PORT(RESET,CLK : IN STD_LOGIC;
	DATA : IN STD_LOGIC_VECTOR(7 downto 0);       --The Input data
	OUTPUT : INOUT STD_LOGIC_VECTOR(127 downto 0)); -- The Output stores every one of the 8 bit numbers, 16 in total
end MainRegister;

--}} End of automatically maintained section

architecture MainRegister of MainRegister is
begin
	Process(CLK,RESET)	   	
	BEGIN
	if(RESET = '1') then 
		OUTPUT <= conv_std_logic_vector(0,128);
	else   
		if(CLK'EVENT and CLK = '1')	 then 
			for i in 15 downto 1 loop
				OUTPUT(i*8+7 downto i*8) <= OUTPUT((i-1)*8+7 downto (i-1)*8);
			end loop;
			OUTPUT(7 downto 0) <= DATA;
		end if;
	end if;
	end Process;
	 -- enter your statements here --

end MainRegister;
