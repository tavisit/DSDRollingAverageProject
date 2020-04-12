---------------------------------------------------------------------------------------------------
--
-- Title       : NBitAdder
-- Design      : Project
-- Author      : OctavianMatei
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : NBitAdder.vhd
-- Generated   : Sun Apr 12 14:37:23 2020
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
--{entity {NBitAdder} architecture {NBitAdder}}	  
	
-- Seven Bit Adder_____________________________________________________________________________________________________________
library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_arith.all;

entity SevenBitAdder is
  port(
    A, B : in std_logic_vector(7 downto 0);
    SUM : out std_logic_vector(8 downto 0));
end SevenBitAdder;		

architecture SevenBitAdder of SevenBitAdder is
signal tmp: std_logic_vector(8 downto 0);		 
  begin
    tmp <= conv_std_logic_vector((unsigned(A) + unsigned(B)),9);
    SUM <= tmp(8 downto 0);
end SevenBitAdder;

-- Eight Bit Adder_____________________________________________________________________________________________________________
library IEEE;
use IEEE.STD_LOGIC_1164.all; 
USE ieee.std_logic_arith.all;

entity EightBitAdder is
  port(
    A, B : in std_logic_vector(8 downto 0);
    SUM : out std_logic_vector(9 downto 0));
end EightBitAdder;		

architecture EightBitAdder of EightBitAdder is
signal tmp: std_logic_vector(9 downto 0);		 
  begin
    tmp <= conv_std_logic_vector((unsigned(A) + unsigned(B)),10);
    SUM <= tmp(9 downto 0);
end EightBitAdder;

-- Nine Bit Adder_____________________________________________________________________________________________________________
library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_arith.all;

entity NineBitAdder is
  port(
    A, B : in std_logic_vector(9 downto 0);
    SUM : out std_logic_vector(10 downto 0));
end NineBitAdder;		

architecture NineBitAdder of NineBitAdder is
signal tmp: std_logic_vector(10 downto 0);		 
  begin
    tmp <= conv_std_logic_vector((unsigned(A) + unsigned(B)),11);
    SUM <= tmp(10 downto 0);
end NineBitAdder;

-- Ten Bit Adder_____________________________________________________________________________________________________________
library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_arith.all;

entity TenBitAdder is
  port(
    A, B : in std_logic_vector(10 downto 0);
    SUM : out std_logic_vector(11 downto 0));
end TenBitAdder;		

architecture TenBitAdder of TenBitAdder is
signal tmp: std_logic_vector(11 downto 0);		 
  begin
    tmp <= conv_std_logic_vector((unsigned(A) + unsigned(B)),12);
    SUM <= tmp(11 downto 0);
end TenBitAdder; 	 

-- Eleven Bit Adder_____________________________________________________________________________________________________________

library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_arith.all;

entity ElevenBitAdder is
  port(
    A, B : in std_logic_vector(11 downto 0);
    SUM : out std_logic_vector(12 downto 0));
end ElevenBitAdder;		

architecture ElevenBitAdder of ElevenBitAdder is
signal tmp: std_logic_vector(12 downto 0);		 
  begin
    tmp <= conv_std_logic_vector((unsigned(A) + unsigned(B)),13);
    SUM <= tmp(12 downto 0);
end ElevenBitAdder; 