---------------------------------------------------------------------------------------------------
--
-- Title       : BITADDER
-- Design      : WORK
-- Author      : OctavianMatei
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : BITADDER.vhd
-- Generated   : Fri Apr 17 18:27:28 2020
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
--{entity {BITADDER} architecture {BITADDER}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity BITADDER is	
	PORT(
	A,B,CarryIN : in std_logic;
	S,CarryOUT : out std_logic);
end BITADDER;

--}} End of automatically maintained section

architecture BITADDER of BITADDER is
begin
	 S   <= A xor B;
  	CarryOUT <= A and B;
	 -- enter your statements here --

end BITADDER;
