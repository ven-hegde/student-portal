<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.awt.image.BufferedImage" %>
<%@page import="javax.imageio.ImageIO" %>
<%@page import="java.io.File" %>
<%@page import="java.io.ByteArrayOutputStream" %>
<%
String id = request.getParameter("id");
 int userId = Integer.parseInt(id.trim());
String dbUrl = "jdbc:mysql://localhost:3306/student_portal";
String username = "root";
String password = "0112358";
 
Connection con = null;
 
try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(dbUrl, username, password);
    
    PreparedStatement ps = con.prepareStatement("select * from user where iduser=?");
    ps.setInt(1, userId);
    ResultSet rs = ps.executeQuery();
 
    if(rs.next()){
        Blob blob = rs.getBlob("profilePhoto");
        if(null != blob){
        	 byte byteArray[] = blob.getBytes(1, (int)blob.length());;
             response.setContentType("image/gif");
             OutputStream os = response.getOutputStream();
             os.write(byteArray);
             os.flush();
             os.close();
        }
       
    }
}
catch(Exception e){
	
	
    e.printStackTrace();
}   
finally{
    if(con != null){
        try{
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
%>