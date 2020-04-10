package kr.or.tta.bmt.common;

import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBManager {
	
	private static final Logger logger = Logger.getLogger(DBManager.class.getName());
	private Context ctx;
	private static  DBManager instance;


	
	public DBManager()
	{
 
	}
	

	public static DBManager getInstance()
	{
		if (instance==null)
		{
			instance=new DBManager();
		}
		return instance;
			
	}
	
	
	
	
	public  Connection getConnection(String dataSource)
	{
		DataSource ds = null;
		Connection con = null;		
	    try
	    {
			ctx = new InitialContext();
			// get each datasource
			ds=(javax.sql.DataSource)ctx.lookup(dataSource);
			// get each connection
			con = ds.getConnection();

	    }catch  (NamingException e)
	    {
	    	logger.log(Level.SEVERE,e.getMessage());
	    	e.printStackTrace();
	    } catch (SQLException e) {
	    	logger.log(Level.SEVERE,e.getMessage());
			e.printStackTrace();
		}
		logger.log(Level.INFO, "# getConnection ");
		logger.log(Level.INFO, "#########################");
		
		return con;


	}
	 
	public  void updateSQL(PreparedStatement ps) throws Exception
	{ 
			
		ps.executeUpdate();
		logger.log(Level.INFO, "# updateSQL ");  

	}
	
	public ResultSet selectSQL(PreparedStatement ps)
	{		
		ResultSet rs = null;			
	    try {
			rs = ps.executeQuery();
			
		} catch (SQLException e) {
			logger.log(Level.SEVERE,e.getMessage());
			e.printStackTrace();
		}     
		logger.log(Level.INFO, "# selectSQL ");
		logger.log(Level.INFO, "# resultSet: " + rs);
				
		return  rs;
	}
	
	public  void insertSQL(PreparedStatement ps) throws Exception
	{
		ps.executeUpdate();
		logger.log(Level.INFO, "# insertSQL ");
	    
	}

	public void close(Connection dataSource)
	{	
		if(dataSource != null)
	     {
	      try
	      {
	      dataSource.close();
	      }catch(SQLException e)
	      {e.printStackTrace();}
	     }			
		logger.log(Level.INFO, "# close DataSource ");
	}
	
	public void close(Connection dataSource, ResultSet rs, PreparedStatement ps)
	{	
		

		if(dataSource != null)
	     {
	      try
	      {
	    	  dataSource.close();
	      }catch(SQLException e)
	      {e.printStackTrace();}
	     }		

		if(ps != null)
	     {
	      try
	      {
	    	  ps.close();
	      }catch(SQLException e)
	      {e.printStackTrace();}
	     }	
		
		if(rs != null)
	     {
	      try
	      {
	    	  rs.close();
	      }catch(SQLException e)
	      {e.printStackTrace();}
	     }		
		
		logger.log(Level.INFO, "# close DataSource, ResultSet , ps ");
	}	
	
	public void close(PreparedStatement ps)
	{
		 if(ps != null)
	     {
	      try
	      {
	    	  ps.close();
	      }catch(SQLException e)
	      {e.printStackTrace();}
	     }
		logger.log(Level.INFO, "# close PreparedStatement  ");
	}
}
