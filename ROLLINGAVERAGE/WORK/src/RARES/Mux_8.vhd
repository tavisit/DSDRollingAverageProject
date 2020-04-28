 ---------------------------------------------------------------------------------------------------
--
-- Title       : Mux_8
-- Design      : WORK
-- Author      : Man Rares
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : Mux_8.vhd
-- Generated   : Mon Apr 27 13:49:00 2020
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

entity Mux_8 is	
	PORT ( A: in Std_logic_vector(7 downto 0);
		   B : in Std_logic_vector(7 downto 0);
		   C : in Std_logic_vector(7 downto 0);
		   D : in Std_logic_vector(7 downto 0);
		   E : in Std_logic_vector(7 downto 0);
		   F : in Std_logic_vector(7 downto 0);
		   G : in Std_logic_vector(7 downto 0);
		   H : in Std_logic_vector(7 downto 0);
		   Sel: in Std_logic_vector(2 downto 0);
		   Data : out Std_logic_vector(7 downto 0));
end Mux_8;

architecture Mux of Mux_8 is
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
				When "111" => Data <= H;
				When Others => Data <= "00000000";
		END CASE;
	end PROCESS;
end Mux;