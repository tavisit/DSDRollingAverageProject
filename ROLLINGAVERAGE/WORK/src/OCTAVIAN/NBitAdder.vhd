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
use IEEE.numeric_std.all;
 
entity NBitAdder is	
  generic(
  numberOfInputs : Integer := 8); 
  port(
        inputs1 : in std_logic_vector(numberOfInputs-1 downto 0);
        inputs2 : in std_logic_vector(numberOfInputs-1 downto 0);
        outputs : out std_logic_vector(numberOfInputs downto 0)
    );
end NBitAdder;		

architecture NBITADDER of NBitAdder is	  

signal carry  : std_logic_vector(numberOfInputs downto 0);
signal result : std_logic_vector(numberOfInputs - 1 downto 0); 

begin

    carry(0) <= '0';

    FORLOOP:for I in 0 to numberOfInputs-1 generate
    begin
        result(I) <= inputs1(I) xor inputs2(I) xor carry(I);
        carry(I+1) <= 
            (inputs1(I) and inputs2(I)) or 
            (inputs1(I) and carry(I))   or
            (inputs2(I) and carry(I));
    end generate;

    outputs <= carry(numberOfInputs) & result;
end NBITADDER;