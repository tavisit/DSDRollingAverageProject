---------------------------------------------------------------------------------------------------
--
-- Title       : HEXCONVERTER
-- Design      : Project
-- Author      : OctavianMatei
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : HEXCONVERTER.vhd
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
--{entity {HEXCONVERTER} architecture {HEXCONVERTER}}
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- This component is Binary to HEX converter to 7 segment display
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;

entity HEXCONVERTER is
	PORT( 	
	CLK : IN STD_LOGIC;							-- USES SYSTEM CLOCK, NOT DATA CLOCK TO DISPLAY
		INPUTF:IN STD_LOGIC_VECTOR(7 downto 0 );	-- INPUT SEGMENTED IN TWO PARTS
		INPUTG:IN STD_LOGIC_VECTOR(7 downto 0 );	-- INPUT SEGMENTED IN TWO PARTS 
		ANODE : OUT STD_LOGIC_VECTOR(3 downto 0);   -- TO ACTIVATE THE ES OF THE 7-SEGMENT
		OUTPUT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));	-- OUTPUT DISPLAY
end HEXCONVERTER;

--}} End of automatically maintained section

architecture HEXCONVERTER of HEXCONVERTER is  
BEGIN
process(CLK)
	variable CLK_DIV:integer:=0;
	variable NUMBER_ANODE:bit:='0';
	variable TYPE_INPUT:bit:='0';
	variable TEMP_OUTPUT:std_logic_vector(7 downto 0):=("11111111");
	begin  		
		if(CLK'EVENT AND CLK = '1') then
			if (CLK_DIV=0) then -- FOR THE SIMULATION, CLK_DIV = 0, FOR THE REAL THING, CLK_DIV = 100000
				CLK_DIV:=0;
			
				if(TYPE_INPUT='0') then	 -- INPUT FROM THE FILTER OR GENERATOR
					
					if(NUMBER_ANODE='0') then --FIRST OR SECOND ANODE ON EACH LEVEL 
						ANODE <= "0111";
					else
						ANODE <= "1011";
					end if;
				else
					if(NUMBER_ANODE='0') then
						ANODE <= "1101";
					else
						ANODE <= "1110";
					end if;
				end if;
				if(TYPE_INPUT='0') then
					if(NUMBER_ANODE='0') then
						case INPUTG(7 downto 4) is
							when "0000" => TEMP_OUTPUT := "00000011"; -- 0
							when "0001" => TEMP_OUTPUT := "10011111"; -- 1
							when "0010" => TEMP_OUTPUT := "00100101"; -- 2
							when "0011" => TEMP_OUTPUT := "00001101"; -- 3
							when "0100" => TEMP_OUTPUT := "10011001"; -- 4
							when "0101" => TEMP_OUTPUT := "01001001"; -- 5
							when "0110" => TEMP_OUTPUT := "01000001"; -- 6   
							when "0111" => TEMP_OUTPUT := "00011111"; -- 7
							when "1000" => TEMP_OUTPUT := "00000001"; -- 8
							when "1001" => TEMP_OUTPUT := "00001001"; -- 9
							when "1010" => TEMP_OUTPUT := "00010001"; -- A
							when "1011" => TEMP_OUTPUT := "11000001"; -- b
							when "1100" => TEMP_OUTPUT := "11100101"; -- c
							when "1101" => TEMP_OUTPUT := "10000101"; -- d
							when "1110" => TEMP_OUTPUT := "01100001"; -- E
							when others => TEMP_OUTPUT := "01110001"; -- F
						end case;		
						OUTPUT<=TEMP_OUTPUT;
					else
						case INPUTG(3 downto 0) is
							when "0000" => TEMP_OUTPUT := "00000011"; -- 0
							when "0001" => TEMP_OUTPUT := "10011111"; -- 1
							when "0010" => TEMP_OUTPUT := "00100101"; -- 2
							when "0011" => TEMP_OUTPUT := "00001101"; -- 3
							when "0100" => TEMP_OUTPUT := "10011001"; -- 4
							when "0101" => TEMP_OUTPUT := "01001001"; -- 5
							when "0110" => TEMP_OUTPUT := "01000001"; -- 6   
							when "0111" => TEMP_OUTPUT := "00011111"; -- 7
							when "1000" => TEMP_OUTPUT := "00000001"; -- 8
							when "1001" => TEMP_OUTPUT := "00001001"; -- 9
							when "1010" => TEMP_OUTPUT := "00010001"; -- A
							when "1011" => TEMP_OUTPUT := "11000001"; -- b
							when "1100" => TEMP_OUTPUT := "11100101"; -- c
							when "1101" => TEMP_OUTPUT := "10000101"; -- d
							when "1110" => TEMP_OUTPUT := "01100001"; -- E
							when others => TEMP_OUTPUT := "01110001"; -- F
							end case;		
							OUTPUT<=TEMP_OUTPUT;
					end if;
					NUMBER_ANODE:=not(NUMBER_ANODE);
				
				else 
					if(NUMBER_ANODE='0') then
						case INPUTF(7 downto 4) is
							when "0000" => TEMP_OUTPUT := "00000011"; -- 0
							when "0001" => TEMP_OUTPUT := "10011111"; -- 1
							when "0010" => TEMP_OUTPUT := "00100101"; -- 2
							when "0011" => TEMP_OUTPUT := "00001101"; -- 3
							when "0100" => TEMP_OUTPUT := "10011001"; -- 4
							when "0101" => TEMP_OUTPUT := "01001001"; -- 5
							when "0110" => TEMP_OUTPUT := "01000001"; -- 6   
							when "0111" => TEMP_OUTPUT := "00011111"; -- 7
							when "1000" => TEMP_OUTPUT := "00000001"; -- 8
							when "1001" => TEMP_OUTPUT := "00001001"; -- 9
							when "1010" => TEMP_OUTPUT := "00010001"; -- A
							when "1011" => TEMP_OUTPUT := "11000001"; -- b
							when "1100" => TEMP_OUTPUT := "11100101"; -- c
							when "1101" => TEMP_OUTPUT := "10000101"; -- d
							when "1110" => TEMP_OUTPUT := "01100001"; -- E
							when others => TEMP_OUTPUT := "01110001"; -- F
						end case;		
						OUTPUT<=TEMP_OUTPUT;
					else 
						case INPUTF(3 downto 0) is
							when "0000" => TEMP_OUTPUT := "00000011"; -- 0
							when "0001" => TEMP_OUTPUT := "10011111"; -- 1
							when "0010" => TEMP_OUTPUT := "00100101"; -- 2
							when "0011" => TEMP_OUTPUT := "00001101"; -- 3
							when "0100" => TEMP_OUTPUT := "10011001"; -- 4
							when "0101" => TEMP_OUTPUT := "01001001"; -- 5
							when "0110" => TEMP_OUTPUT := "01000001"; -- 6   
							when "0111" => TEMP_OUTPUT := "00011111"; -- 7
							when "1000" => TEMP_OUTPUT := "00000001"; -- 8
							when "1001" => TEMP_OUTPUT := "00001001"; -- 9
							when "1010" => TEMP_OUTPUT := "00010001"; -- A
							when "1011" => TEMP_OUTPUT := "11000001"; -- b
							when "1100" => TEMP_OUTPUT := "11100101"; -- c
							when "1101" => TEMP_OUTPUT := "10000101"; -- d
							when "1110" => TEMP_OUTPUT := "01100001"; -- E
							when others => TEMP_OUTPUT := "01110001"; -- F
						end case;		
						OUTPUT<=TEMP_OUTPUT;
					end if;
					NUMBER_ANODE:=not(NUMBER_ANODE);
				end if;
				if NUMBER_ANODE='1' then 
					TYPE_INPUT:=not(TYPE_INPUT);
				end if;			
			else		
				CLK_DIV:=CLK_DIV+1;
			end if;
		end if;
	end process;   

end HEXCONVERTER;
