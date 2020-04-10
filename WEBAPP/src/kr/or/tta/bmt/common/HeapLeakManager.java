package kr.or.tta.bmt.common;

import java.util.*;
import javassist.*;

public class HeapLeakManager {

	  private boolean infinite;
	  private int count;
	  private int classCount=0;
	  public  enum CheckType {Heap, Perm};
	  ArrayList<StringBuilder> myArrayList = new ArrayList<StringBuilder>();
	  String temp="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
	  String className="kr.or.tta.bmt.F12.TEMP";
	  
	  private CheckType type;
	  

	  public HeapLeakManager()
	  {
	    this.infinite = false;
	    this.count = 1000;
	    this.type= CheckType.Heap;
	  }
	  
	  public HeapLeakManager(boolean infinite, int count, CheckType type )
	  {
	    this.infinite = infinite;
	    this.count = count;
	    this.type=type;
	  }
	  
	  
	  public static Class generate(String name)
			    throws Exception
			  { 
			    ClassPool pool = ClassPool.getDefault();
			    
			    return pool.makeClass(name).toClass();
			  }	  
	  public HashMap makeHeapLeak() throws Exception
	  {
		  HashMap hm;
		  if (this.infinite) 
		  {
			  while(true){
				  Thread.sleep(500);
		         for(int i=0;i<2000 ; i++)
		         {
		                myArrayList.add(new StringBuilder(temp));
		         } 
		         printHeapInfo(); 
			  }

		  }
		  else
		  {
		         for(int i=0;i<this.count ; i++)
		         {
		                myArrayList.add(new StringBuilder(temp));
		         }  
		  }
		  
		  return printHeapInfo();

	  }
	  
	  public HashMap makePermLeak() throws Exception
	  {
		  HashMap hm;
		  if (this.infinite) 
		  {
			  while(true){
				  Thread.sleep(500);
			      for (int i = 0; i < 2000; i++)
			      {
			        generate(className + this.classCount);
			        this.classCount += 1L;
			 
			      }		 
			      printHeapInfo();
			  }
		  }
		  else
		  {
		      for (int i = 0; i < this.count; i++)
		      {
		    	generate(className + this.classCount);
		        this.classCount += 1L;
		        
		   
		      }
		  }
		  return printHeapInfo();  
	  }
	  
	  public HashMap printHeapInfo() throws Exception, SecurityException
	  {
		  HashMap hm = new HashMap<String,Object>();
		  long heapSize = Runtime.getRuntime().totalMemory()/1024/1024;
		  long freeHeapSize = Runtime.getRuntime().freeMemory()/1024/1024;		  
		  ClassLoader myCL = Thread.currentThread().getContextClassLoader();
	      if (myCL != null) {	    	  	    	 
	            System.out.println("ClassLoader: " + myCL);
	           
	            Class CL_class = myCL.getClass();
	            while (CL_class != java.lang.ClassLoader.class) {
	                CL_class = CL_class.getSuperclass();
	            }
	            java.lang.reflect.Field ClassLoader_classes_field = CL_class.getDeclaredField("classes");
	            ClassLoader_classes_field.setAccessible(true);
	            Vector classes = (Vector) ClassLoader_classes_field.get(myCL);
	            
	            System.out.println(classes.size());
	            System.out.printf("Number of Loaded Class is %d \n", classes.size());
	            /*
	            for (Iterator iter = list(myCL); iter.hasNext();) {
	                System.out.println("\t" + iter.next());
	            }*/
	            //myCL = myCL.getParent();
	            
	            hm.put("classesSize", classes.size());
	        } 		
	     
	      hm.put("heapSize", heapSize);
	      hm.put("freeHeapSize", freeHeapSize);
	      hm.put("ArraySize", myArrayList.size());
	      
	      System.out.printf("HeapSize =  %d MB\n", heapSize);
	      System.out.printf("FreeHeapSize = %d MB \n", freeHeapSize);
	      System.out.printf("ArraySize = %d °³ \n", myArrayList.size());
	      
	      
	      
	      return hm;
	      
	  }
	  
	  public HashMap doLeak() throws Exception
	  {
		  HashMap hm = null;
				switch (this.type) {
                case Perm:
					hm = makePermLeak();
					break;                					
				default:
					hm = makeHeapLeak();
					break;
				}
		  return hm;
	  }
	  
	  public  static void main(String args[]) throws Exception
	  {
		  HeapLeakManager hlm = new HeapLeakManager(true, 1000, CheckType.Heap);
		  hlm.doLeak();
		  hlm.printHeapInfo();
	  }
	  
	  
}
