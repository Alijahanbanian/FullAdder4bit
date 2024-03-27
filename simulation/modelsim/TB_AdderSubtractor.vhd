LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
USE work.random_generators.all  ; 
ENTITY \m\  IS 
END ; 
 
ARCHITECTURE \m_arch\   OF \m\   IS
  SIGNAL sw   :  std_logic_vector (9 downto 0)  ; 
  SIGNAL ledr   :  std_logic_vector (9 downto 0)  ; 
  COMPONENT AdderSubtractor  
    PORT ( 
      sw  : in std_logic_vector (9 downto 0) ; 
      ledr  : out std_logic_vector (9 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : AdderSubtractor  
    PORT MAP ( 
      sw   => sw  ,
      ledr   => ledr   ) ; 



-- "Random Pattern"(Normal) : seed = 1
-- Start Time = 0 ps, End Time = 1 ns, Period = 125 ps
  Process
	variable max_rand : real := pow(2.0, real(sw'length))-1.0;
	variable iv : genstatus1;
	variable iy : genstatus2;
	variable rndval : real;
	variable mean : real := 0.0;
	variable seed : integer := 1 ;
	Begin
	iv(NTAB) := 0;
	iv(NTAB+1) := 0;
	 sw  <= "0010101000"  ;
	wait for 125 ps ;
	 sw  <= "1101010000"  ;
	wait for 125 ps ;
	 sw  <= "0011000000"  ;
	wait for 125 ps ;
	 sw  <= "1001110101"  ;
	wait for 125 ps ;
	 sw  <= "1101001100"  ;
	wait for 125 ps ;
	 sw  <= "1010011101"  ;
	wait for 125 ps ;
	 sw  <= "0111010010"  ;
	wait for 125 ps ;
	 sw  <= "0011000111"  ;
	wait for 125 ps ;
-- dumped values till 1 ns
	wait;
 End Process;
END;
