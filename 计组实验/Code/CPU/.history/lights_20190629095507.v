	initial begin
		//初始A均设置为0，此时应该黄灯亮
		A = 0;
		B = 0;
		
		//250纳秒后，B为1，这个时候红绿灯亮
		#250;
      	B = 1;
		
		//250纳秒后，A为1，B为0，这个时候红绿灯亮
		#250;
		A = 1;
		B = 0;
		
		//250秒后，A为1，B为1，这个时候黄灯亮
		#250;
		B = 1;
	end
      