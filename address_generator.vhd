LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY address_generator IS
	PORT(      
		load        : IN   STD_LOGIC;
		column      : IN   INTEGER; --STD_LOGIC_VECTOR(31 DOWNTO 0);
		row      : IN   INTEGER; --STD_LOGIC_VECTOR(31 DOWNTO 0);
		address     : OUT   STD_LOGIC_VECTOR(16 DOWNTO 0):=(OTHERS => '0'));      --ROM address
END address_generator;

ARCHITECTURE behavior OF address_generator IS
BEGIN
	
	PROCESS(column, row)
	VARIABLE counter	:	STD_LOGIC_VECTOR(16 DOWNTO 0); --:= (OTHERS => '0'); 
	BEGIN

			IF(load = '1')THEN
				--IF((column>= 0) AND (column<=399) AND (row>=0) AND (row<=223))THEN
					counter := std_logic_vector(to_unsigned(to_integer(unsigned( counter)) + 1, 17));
				--address <='1';
				IF((column=1279) AND (row=1023))THEN
					counter := (OTHERS => '0');
				END IF;
			END IF;
		address<=counter;
	END PROCESS;
END behavior;