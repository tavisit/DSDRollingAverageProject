 ---------------------------------------------------------------------------------------------------
--
-- Title       : Mux_8_2
-- Design      : WORK
-- Author      : Man Rares
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : Mux_8_2.vhd
-- Generated   : Tue Apr 28 20:00:02 2020
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

entity Mux_8_2 is	
	PORT ( A: in Std_logic;
		   B : in Std_logic;
		   C : in Std_logic;
		   D : in Std_logic;
		   E : in Std_logic;
		   F : in Std_logic;
		   G : in Std_logic;
		   H : in Std_logic;
		   Sel: in Std_logic_vector(2 downto 0);
		   Data : out Std_logic);
end Mux_8_2;

architecture Mux_8_2 of Mux_8_2 is
begin
	PROCESS(Sel,A,B,C,D,E,F,G,H)
	Begin		  
		CASE(Sel(2 downto 0)) is
				When "000" => Data <= A;
				When "001" => Data <= B;
				When "010" => Data <= C;	 	 
				When "011" => Data <= D;	 
				When "100" => Data <= E;
				When "101" => Data <= F;
				When "110" => Data <= G;
				When Others => Data <= H;
		END CASE;
	end PROCESS;
end Mux_8_2;