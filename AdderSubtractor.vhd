--*********************************************
-- Ali jahanbanian - 9811307
-- File: AdderSubtractor.vhd
-- Design Units:
--		input: sw 
--		output: ledr
--		function: Full Adder Or Subtractor 4Bit
-- File TestBench: tb_AdderSubtractor.vhd
--********************************************	

--------------- Pervious Code:
--LIBRARY IEEE;
--USE IEEE.STD_LOGIC_1164.ALL;
--
--ENTITY AdderSubtractor IS
--	PORT(
--			sw		: IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
--			ledr	: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
--		);
--END AdderSubtractor;
--
--ARCHITECTURE Structure OF AdderSubtractor IS 
--
--	
--	SIGNAL c						: STD_LOGIC_VECTOR(9 DOWNTO 0);			-- c = Caarry Additoin			
--	SIGNAL input1, input2, input3	: STD_LOGIC_VECTOR(9 DOWNTO 0);
--	
--	COMPONENT fulladd
--		PORT(
--				cin, x, y  :  IN  STD_LOGIC;
--				s, cout    : OUT  STD_LOGIC 
--			);
--	END COMPONENT;
--		
--BEGIN 
--		
--		-- Convert The First Input From 4 Bits to 10 Bits
--		input1 <= "000000" & sw(3 downto 0);
--		-- Convert The Second Input From 4 Bits to 10 Bits
--		input2 <= "000000" & sw(8 downto 5);
--		-- If The Operand Was Subtractor(sw(4)='1'), One's Complement Second Input
--		input3 <= input2 When (sw(4)='0') Else not(input2);
--		
--		stage0: fulladd PORT MAP(sw(4), input1(0), input3(0), ledr(0), c(0));	-- If sw(4)='1', The One's Complement
--																				-- Becomes The Two's Complement
--		stage1: fulladd PORT MAP(c(0), input1(1), input3(1), ledr(1), c(1));
--		stage2: fulladd PORT MAP(c(1), input1(2), input3(2), ledr(2), c(2));
--		stage3: fulladd PORT MAP(c(2), input1(3), input3(3), ledr(3), c(3));
--		stage4: fulladd PORT MAP(c(3), input1(4), input3(4), ledr(4), c(4));
--		stage5: fulladd PORT MAP(c(4), input1(5), input3(5), ledr(5), c(5));
--		stage6: fulladd PORT MAP(c(5), input1(6), input3(6), ledr(6), c(6));
--		stage7: fulladd PORT MAP(c(6), input1(7), input3(7), ledr(7), c(7));
--		stage8: fulladd PORT MAP(c(7), input1(8), input3(8), ledr(8), c(8));
--		stage9: fulladd PORT MAP(c(8), input1(9), input3(9), ledr(9), c(9)); 
--
--END Structure;
------------------------------------------
--LIBRARY IEEE;
--USE IEEE.STD_LOGIC_1164.ALL;
--
--ENTITY fulladder IS 
--	PORT(
--			cin, x, y		:  IN  STD_LOGIC;		 -- cin  = carry Addition input
--			s, cout			: OUT  STD_LOGIC 		 -- cout = carry Addition output
--		);
--END fulladder;
--
--ARCHITECTURE logic_func OF fulladder IS
--BEGIN
--	
--	-- Sum:
--	s <= x XOR y XOR cin;
--	-- Carry Addition:
--	cout <= (x AND y) OR (x and cin) OR (cin AND y);
--	
--END logic_func;

--=============================================================
-- Bugs:
-- Writing a Wrong And Unprincipled Comment on The Lines 25, 63, 64, 71, 73.
-- Do Not Use "FOR GENERATE" On Lines 44 to 54. 
-- Separation Of Two Codes In Two Different Files.
-- Inaccurate Variable Name In Line 25.
--=============================================================
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY AdderSubtractor IS
	PORT(
			sw		: IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
			ledr	: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
		);
END AdderSubtractor;

ARCHITECTURE Structure OF AdderSubtractor IS 

	
	SIGNAL carry						: STD_LOGIC_VECTOR(10 DOWNTO 0);			
	SIGNAL input1, input2, input3   	: STD_LOGIC_VECTOR(9 DOWNTO 0);
	
	COMPONENT FA
		PORT(
				cin, x, y  :  IN  STD_LOGIC;
				s, cout    : OUT  STD_LOGIC 
			);
	END COMPONENT;
		
BEGIN 
		
		-- Convert The First Input From 4 Bits to 10 Bits
		input1 <= "000000" & sw(3 DOWNTO 0);
		-- Convert The Second Input From 4 Bits to 10 Bits
		input2 <= "000000" & sw(8 DOWNTO 5);
		-- If The Operand Was Subtractor(sw(4) = '1'), One's Complement Second Input
		input3 <= input2 WHEN (sw(4) = '0') Else NOT(input2);
		-- If sw(4) = '1', The One's Complement Becomes The Two's Complement By Adding '1' As The Cin in FA
		carry(0) <= sw(4);
		
		FA_Stages_generate : FOR Counter IN 0 TO 9 GENERATE
		stage : FA PORT MAP(carry(Counter), input1(Counter), input2(Counter), ledr(Counter), carry(Counter + 1)); 
		END GENERATE FA_Stages_generate; 

END Structure;	

--===============================================================

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FA IS 
	PORT(
			cin, x, y		:  IN  STD_LOGIC;
			s, cout			: OUT  STD_LOGIC
		);
END FA;

ARCHITECTURE logic_func OF FA IS
BEGIN
	
	s <= x XOR y XOR cin;
	cout <= (x AND y) OR (x and cin) OR (cin AND y);
	
END logic_func;
