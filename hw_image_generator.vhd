LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY hw_image_generator IS
	PORT(
		load		   :	IN		STD_LOGIC;
		r		   	:	IN		STD_LOGIC_VECTOR(7 downto 0);
		g	   		:	IN		STD_LOGIC_VECTOR(7 downto 0);
		b		   	:	IN		STD_LOGIC_VECTOR(7 downto 0);
		disp_ena		:	IN		STD_LOGIC;	--display enable ('1' = display time, '0' = blanking time)
		row			:	IN		INTEGER;		--row pixel coordinate
		column		:	IN		INTEGER;		--column pixel coordinate
		red			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0):= (OTHERS => '0');  --red magnitude output to DAC
		green			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0):= (OTHERS => '0');  --green magnitude output to DAC
		blue			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0):= (OTHERS => '0')); --blue magnitude output to DAC
		
END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS
BEGIN
	
	PROCESS(disp_ena, row, column)
	BEGIN
		IF(load = '1')THEN
				red <= r;
				green	<= g;
				blue <= b;
		END IF;
		IF(disp_ena = '1') THEN		--display time
			IF(load = '1')THEN
				red <= r;
				green	<= g;
				blue <= b;
			END IF;
		ELSE								--blanking time
			red <= (OTHERS => '0');
			green <= (OTHERS => '0');
			blue <= (OTHERS => '0');
		END IF;
	
	END PROCESS;
END behavior;