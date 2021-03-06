	---------------------------------------------------------------------------------------------------
--
-- Title       : Filter
-- Design      : Project
-- Author      : OctavianMatei
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : Filter.vhd
-- Generated   : Sun Apr 12 16:46:40 2020
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
--{entity {Filter} architecture {Filter}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_arith.all;

entity Filter is
	PORT(RESET,DATA_CLOCK,SYSTEM_CLOCK : IN STD_LOGIC;
		DATA : IN STD_LOGIC_VECTOR(7 downto 0);	  
		LENGTH: IN STD_LOGIC_VECTOR(2 downto 0);
		ANODE: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0));
end Filter;

--}} End of automatically maintained section

architecture Filter of Filter is  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 													                       Necessary components																							  --
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
component MainRegister is 
	PORT(RESET,CLK : IN STD_LOGIC;
	DATA : IN STD_LOGIC_VECTOR(7 downto 0);       --The Input data
	OUTPUT : INOUT STD_LOGIC_VECTOR(127 downto 0)); -- The Output stores every one of the 8 bit numbers, 16 in total
end component;

-- FOR CHOICE OF THE TYPE OF AVERAGE
component MUX is	
	PORT ( A: IN STD_LOGIC_VECTOR(8 downto 0);
	B : IN STD_LOGIC_VECTOR(9 downto 0);
	C : IN STD_LOGIC_VECTOR(10 downto 0);
	D : IN STD_LOGIC_VECTOR(11 downto 0);
	SELECTION_LENGTH: IN STD_LOGIC_VECTOR(2 downto 0);
	SUM : OUT STD_LOGIC_VECTOR(11 downto 0));
end component;	

-- COMPONENET WHICH DISPLAYS THE INPUT NUMBER AND THE AVERAGE ON A 7-SEGMENT DISPLAY
component HEXCONVERTER is
	PORT( 	
	CLK : IN STD_LOGIC;							-- USE SYSTEM CLOCK
		INPUTF:IN STD_LOGIC_VECTOR(7 downto 0 );	-- INPUT SEGMENTED IN TWO PARTS
		INPUTG:IN STD_LOGIC_VECTOR(7 downto 0 );	-- INPUT SEGMENTED IN TWO PARTS 
		ANODE : OUT STD_LOGIC_VECTOR(3 downto 0);   -- TO ACTIVATE THE ANODES OF THE 7-SEGMENT
		OUTPUT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));	-- OUTPUT DISPLAY
end component;

--lENGTH CONTROLS HOW MUCH TO SHIFT
--SHIFT LENGTH(1 DOWNTO 0)
component SHIFTREGISTER is
	port(
	D: in STD_LOGIC_vector(11 downto 0);
	LENGTH : IN STD_LOGIC_VECTOR (2 downto 0);
	     RESET: in STD_LOGIC;
		 Q: inout STD_LOGIC_vector(11 downto 0));
end component;

--NBITADDER
--WILL BE USED WITH NUMBEROFINPUTS AS FOLLOWS:
--8 FOR THE FIRST LAYER
--9 FOR THE SECOND
--10 FOR THE THIRD
--11 FOR THE FOURTH
component NBitAdder is	
  generic(
  numberOfInputs : Integer); 
  port(
        inputs1 : in std_logic_vector(numberOfInputs-1 downto 0);
        inputs2 : in std_logic_vector(numberOfInputs-1 downto 0);
        outputs : out std_logic_vector(numberOfInputs downto 0)
    );
end component;	  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 													                       Necessary components																							  --
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 													                       Necessary SIGNALS																							  --
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SIGNAL FIRSTOUTPUTS: STD_LOGIC_VECTOR(127 downto 0);
SIGNAL SECONDOUTPUTS: STD_LOGIC_VECTOR(71 downto 0); 
SIGNAL THIRDOUTPUTS: STD_LOGIC_VECTOR(39 downto 0);
SIGNAL FOURTHOUTPUTS: STD_LOGIC_VECTOR(21 downto 0);
SIGNAL FINALOUTPUT: STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL SUM : STD_LOGIC_VECTOR(11 downto 0);  
SIGNAL AVERAGE : STD_LOGIC_VECTOR(11 downto 0);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 													                       Necessary SIGNALS																							  --
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
begin 	
	
	-- MAIN REGISTER - DATA FILLS FROM 0 TO 127
	MREGISTER: MAINREGISTER PORT MAP(RESET,DATA_CLOCK,DATA,FIRSTOUTPUTS);
		
	--First Layer of ADDERS										   
	FFOR: FOR I IN 7 DOWNTO 0 GENERATE		
		BIT8ADDER: NBITADDER
		GENERIC MAP(8)
		PORT MAP(FIRSTOUTPUTS(I*16+7 DOWNTO 16*I),FIRSTOUTPUTS(I*16+15 DOWNTO 16*I+8),SECONDOUTPUTS(I*9+8 DOWNTO 9*I));
	END GENERATE FFOR;
	
	SFOR: FOR I IN 3 DOWNTO 0 GENERATE
		BIT9ADDER: NBITADDER
		GENERIC MAP(9)
		PORT MAP(SECONDOUTPUTS(I*18+8 DOWNTO 18*I),SECONDOUTPUTS(I*18+17 DOWNTO 18*I+9),THIRDOUTPUTS(I*10+9 DOWNTO 10*I));
	END GENERATE SFOR; 
		
	TFOR: FOR I IN 1 DOWNTO 0 GENERATE
		BIT10ADDER: NBITADDER
		GENERIC MAP(10)
		PORT MAP(THIRDOUTPUTS(I*20+9 DOWNTO 20*I),THIRDOUTPUTS(I*20+19 DOWNTO 20*I+10),FOURTHOUTPUTS(I*11+10 DOWNTO 11*I));
	END GENERATE TFOR;		  
		
	BIT11ADDER: NBITADDER
	GENERIC MAP(11)
	PORT MAP(FOURTHOUTPUTS(10 DOWNTO 0),FOURTHOUTPUTS(21 DOWNTO 11),FINALOUTPUT);
	
	
	-- MUX
	--IT HAS IMPLEMENTED THE CONCATENATION IN THE DESIGN OF THE SUMS
	MUX8: MUX PORT MAP(SECONDOUTPUTS(8 DOWNTO 0),THIRDOUTPUTS(9 DOWNTO 0),FOURTHOUTPUTS(10 DOWNTO 0), FINALOUTPUT,LENGTH,SUM);
	
	--SHIFT REGISTER
	SHIFTREG: SHIFTREGISTER PORT MAP(SUM,LENGTH,RESET,AVERAGE);
	
	--DISPLAY THE SUM AND ACTUAL DIGIT
	 HEXCONV: HEXCONVERTER PORT MAP(SYSTEM_CLOCK,AVERAGE(7 DOWNTO 0),DATA,ANODE,OUTPUT);
end Filter;
