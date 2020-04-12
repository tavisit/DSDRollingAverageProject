---------------------------------------------------------------------------------------------------
--
-- Title       : HexConverter
-- Design      : Project
-- Author      : OctavianMatei
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : HexConverter.vhd
-- Generated   : Sun Apr 12 14:48:35 2020
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
--{entity {HexConverter} architecture {HexConverter}}
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- This component is Binary to HEX converter to 7 segment display
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity HexConverter is
	PORT( 	CLK : IN STD_LOGIC;
			INPUT:IN STD_LOGIC_VECTOR(7 downto 0 );	--INPUT SEGMENTED IN TWO PARTS
		  OUTPUT1,OUTPUT2: OUT STD_LOGIC_VECTOR(6 downto 0));
end HexConverter;

--}} End of automatically maintained section

architecture HexConverter of HexConverter is
begin
	process (clk,INPUT)
BEGIN
	 if (clk'event and clk='1') then
 case  INPUT(3 downto 0) is
    when "0000" => OUTPUT1 <= "0000001"; -- "0"     
    when "0001" => OUTPUT1 <= "1001111"; -- "1" 
    when "0010" => OUTPUT1 <= "0010010"; -- "2" 
    when "0011" => OUTPUT1 <= "0000110"; -- "3" 
    when "0100" => OUTPUT1 <= "1001100"; -- "4" 
    when "0101" => OUTPUT1 <= "0100100"; -- "5" 
    when "0110" => OUTPUT1 <= "0100000"; -- "6" 
    when "0111" => OUTPUT1 <= "0001111"; -- "7" 
    when "1000" => OUTPUT1 <= "0000000"; -- "8"     
    when "1001" => OUTPUT1 <= "0000100"; -- "9" 
    when "1010" => OUTPUT1 <= "0000010"; -- "A"
    when "1011" => OUTPUT1 <= "1100000"; -- "B"
    when "1100" => OUTPUT1 <= "0110001"; -- "C"
    when "1101" => OUTPUT1 <= "1000010"; -- "D"
    when "1110" => OUTPUT1 <= "0110000"; -- "E"
    when "1111" => OUTPUT1 <= "0111000"; -- "F"
	when others => OUTPUT1 <= "1111111";  -- ERROR
	end case;
case  INPUT(7 downto 4) is
    when "0000"=> OUTPUT2 <= "0000001";  -- '0'
    when "0001"=> OUTPUT2 <= "1001111";  -- '1'
    when "0010"=> OUTPUT2 <= "0010010";  -- '2'
    when "0011"=> OUTPUT2 <= "0000110";  -- '3'
    when "0100"=> OUTPUT2 <= "1001100";  -- '4'
    when "0101"=> OUTPUT2 <= "0100100";  -- '5'
    when "0110"=> OUTPUT2 <= "0100000";  -- '6'
    when "0111"=> OUTPUT2 <= "0001111";  -- '7'
    when "1000"=> OUTPUT2 <= "0000000";  -- '8'
    when "1001"=> OUTPUT2 <= "0000100";  -- '9'
	when "1010"=> OUTPUT2 <= "0001000";  -- 'A'
	when "1011"=> OUTPUT2 <= "1100000";  -- 'B'
	when "1100"=> OUTPUT2 <= "0110001";  -- 'C'
	when "1101"=> OUTPUT2 <= "1000010";  -- 'D'
	when "1110"=> OUTPUT2 <= "0110000";  -- 'E'
	when "1111"=> OUTPUT2 <= "0111000";  -- 'F'
    when others=> OUTPUT2 <= "1111111";  -- ERROR
 end case;
end if;
  end process ;
end HexConverter;
