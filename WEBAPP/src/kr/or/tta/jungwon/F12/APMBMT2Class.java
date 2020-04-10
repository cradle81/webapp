package kr.or.tta.jungwon.F12;
 

public class APMBMT2Class {
	
	public APMBMT2Class ()
	{
		System.out.println("Contruction Init");		
	}
	
	
	public void printInfo(int second) throws Exception 
	{
		System.out.println("===========================");
		System.out.println("Start");
		System.out.println("kr.or.tta.jungwon.F12.APMBMT2Class-printInfo");
		Thread.sleep(second*1000);
		System.out.println("kr.or.tta.jungwon.F12.APMBMT2Class-printInfo: "+ second + " sec");
		System.out.println("End");
		System.out.println("===========================");
		
		
	}

}
