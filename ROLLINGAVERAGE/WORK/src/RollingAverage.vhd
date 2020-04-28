---------------------------------------------------------------------------------------------------
--
-- Title       : RollingAverage
-- Design      : WORK
-- Author      : OctavianMatei
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : RollingAverage.vhd
-- Generated   : Mon Apr 27 17:31:12 2020
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
--{entity {RollingAverage} architecture {RollingAverage}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RollingAverage is  
	PORT(  
		-- RESET INPUTS
	RESETG,RESETF:IN STD_LOGIC;
	
	-- FOR THE DATA GENERATOR
	CONTROL: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	-- FOR THE DATA FILTER
	LENGTH: IN STD_LOGIC_VECTOR(2 DOWNTO 0);

	-- CLOCK SIGNALS FOR THE DEVICE
	SYSTEM_CLOCK: IN STD_LOGIC;
	
	-- OUTPUT ANODES AND CATODES FOR A BASYS 3
	ANODE: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	CATODES: OUT STD_LOGIC_VECTOR(7 downto 0));
	
end RollingAverage;

--}} End of automatically maintained section

architecture RollingAverage of RollingAverage is 
component Filter is
	PORT(RESET,DATA_CLOCK,SYSTEM_CLOCK : IN STD_LOGIC;
		DATA : IN STD_LOGIC_VECTOR(7 downto 0);	  
		LENGTH: IN STD_LOGIC_VECTOR(2 downto 0);
		ANODE: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)); 
end component; 

SIGNAL DATA_FILTER: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DATA_CLOCK : STD_LOGIC;
begin
	 DATAFILTER:FILTER PORT MAP (RESETF,DATA_CLOCK,SYSTEM_CLOCK,DATA_FILTER,LENGTH,ANODE,CATODES);
	 -- enter your statements here --

end RollingAverage;
