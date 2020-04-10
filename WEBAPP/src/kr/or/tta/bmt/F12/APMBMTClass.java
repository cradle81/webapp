package kr.or.tta.bmt.F12;

import kr.or.tta.jungwon.F12.*;

public class APMBMTClass {
	
	public APMBMTClass ()
	{
		System.out.println("Contruction Init");		
	}
	
	
	public void printInfo(int second) throws Exception 
	{
		System.out.println("===========================");
		System.out.println("Start");
		System.out.println("printInfo");
		Thread.sleep(second*1000);
		System.out.println("printInfo: "+ second + " sec");
		System.out.println("End");
		System.out.println("===========================");
		
	}
	
	public void printInfo1(int second) throws Exception 
	{
		System.out.println("===========================");
		System.out.println("Start");
		System.out.println("printInfo-1");
		Thread.sleep(second*1000);
		System.out.println("printInfo-1: "+ second + " sec");
		
		printInfo2(second);
		
		System.out.println("End");
		System.out.println("===========================");
		
		
		
	}	
	
	public void printInfo2(int second) throws Exception 
	{
		System.out.println("===========================");
		System.out.println("printInfo-2");
		Thread.sleep(second*1000);
		System.out.println("printInfo-2: "+ second + " sec");
		System.out.println("===========================");
	}		
	public void printInfo3(int second) throws Exception 
	{
		System.out.println("===========================");
		System.out.println("printInfo-3(check method cap time!!!)");
		Thread.sleep(second*1000);
		
		APMBMT2Class apm2 = new APMBMT2Class();
		apm2.printInfo(5);
		
		System.out.println("printInfo-3: "+ second + " sec");
		System.out.println("===========================");
	}
	
}
