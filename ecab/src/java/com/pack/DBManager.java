package com.pack;

import java.sql.*;
import java.util.ArrayList;
import java.util.UUID;

public class DBManager {
    private static final String DBDRIVER = "com.mysql.jdbc.Driver";
    private static final String DBURL = "jdbc:mysql://localhost/ecab";
    private static final String DBUSER = "root";
    private static final String DBPASSWORD = "root";

    static{
        try{
            Class.forName(DBDRIVER);
        }catch(Exception ex){
            System.out.println("Error loading the Driver : "+ex);
        }
    }
    public static boolean addCar(Car car){
        boolean status = false;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("insert into cars values(?,?,?,?,?,?,?,?,?)");
        )
        {
            st.setString(1, car.getVehicleNumber());
            st.setString(2, car.getVehicleType());
            st.setString(3, car.getModel());
            st.setInt(4, car.getSeatingCapacity());
            st.setInt(5, car.getAc());
            st.setInt(6, car.getMusicSystem());
            st.setDouble(7, car.getFixedCharge());
            st.setDouble(8, car.getFare());
            st.setString(9, car.getPhoto());
            st.executeUpdate();
            status = true;
        }
        catch(Exception ex){
            System.out.println("Error registerUser : "+ex);
        }
        return status;
    }
    public static boolean deleteCar(String vehicleNumber){
        boolean status = false;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("delete from cars where VehicleNumber=?");
        )
        {
            st.setString(1, vehicleNumber);
            st.executeUpdate();
            status = true;
        }
        catch(Exception ex){
            System.out.println("Error registerUser : "+ex);
        }
        return status;
    }
    public static boolean updateCar(String vehicleNumber, double fixedCharge, double fare){
        boolean status = false;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("update cars set FixedCharge=?, Fare=?  where VehicleNumber=?");
        )
        {
            st.setDouble(1, fixedCharge);
            st.setDouble(2, fare);
            st.setString(3, vehicleNumber);
            st.executeUpdate();
            status = true;
        }
        catch(Exception ex){
            System.out.println("Error registerUser : "+ex);
        }
        return status;
    }
    public static boolean confirmBooking(Booking b){
        boolean status = false;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("insert into bookings(UserId,TravelDate,Source,Destination,VehicleNumber,TotalFare,BookingDate) values(?,?,?,?,?,?,?)");
        )
        {
            st.setString(1, b.getUserId());
            st.setDate(2, DateConverter.toSqlDate(b.getTravelDate()));
            st.setString(3, b.getSource());
            st.setString(4, b.getDestination());
            st.setString(5, b.getVehicleNumber());
            st.setDouble(6, b.getTotalFare());
            st.setDate(7, DateConverter.toSqlDate(b.getBookingDate()));
            st.executeUpdate();
            status = true;
        }
        catch(Exception ex){
            System.out.println("Error registerUser : "+ex);
        }
        return status;
    }
    public static ArrayList<Booking> getBookings(String userId){
       ArrayList<Booking> list = new ArrayList<Booking>();
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
        )
        {
            String query = "select * from bookings order by BookingDate desc";
            if(userId!=null){
                query = "select * from bookings where UserId='"+userId+"' order by BookingDate desc";
            }
            PreparedStatement st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Booking b = new Booking();
                b.setUserId(rs.getString("UserId"));
                b.setSource(rs.getString("Source"));
                b.setDestination(rs.getString("Destination"));
                b.setBookingDate(DateConverter.toUtilDate(rs.getDate("BookingDate")));
                b.setTravelDate(DateConverter.toUtilDate(rs.getDate("TravelDate")));
                b.setVehicleNumber(rs.getString("VehicleNumber"));
                b.setTotalFare(rs.getDouble("TotalFare"));
                list.add(b);
            }
        }
        catch(Exception ex){
            System.out.println("Error addContact : "+ex);
        }
        return list;
    }
    public static ArrayList<String> getSourceCities(){
       ArrayList<String> list = new ArrayList<String>();
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("select distinct source from locations");
        )
        {
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(rs.getString(1));
            }
        }
        catch(Exception ex){
            System.out.println("Error addContact : "+ex);
        }
        return list;
    }
    public static int getDistance(String source, String destination){
       int distance=-1;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("select distance from locations where Source=? and Destination=?");
        )
        {
            st.setString(1,source);
            st.setString(2,destination);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                distance = rs.getInt(1);
            }
        }
        catch(Exception ex){
            System.out.println("Error addContact : "+ex);
        }
        return distance;
    }
    public static ArrayList<Location> getLocations(String from){
       ArrayList<Location> list = new ArrayList<Location>();
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("select * from locations where Source=?");
        )
        {
            st.setString(1, from);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Location l = new Location();
                l.setLocationId(rs.getInt("LocationId"));
                l.setSource(rs.getString("Source"));
                l.setDestination(rs.getString("Destination"));
                l.setDistance(rs.getInt("Distance"));
                list.add(l);
            }
        }
        catch(Exception ex){
            System.out.println("Error addContact : "+ex);
        }
        return list;
    }
    public static Location getLocation(String from, String to){
       Location l = new Location();
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("select * from locations where Source=? and Destination=?");
        )
        {
            st.setString(1, from);
            st.setString(2, to);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                l.setLocationId(rs.getInt("LocationId"));
                l.setSource(rs.getString("Source"));
                l.setDestination(rs.getString("Destination"));
                l.setDistance(rs.getInt("Distance"));
            }
        }
        catch(Exception ex){
            System.out.println("Error addContact : "+ex);
        }
        return l;
    }
    public static ArrayList<Car> getCars(String vehicleType){
       ArrayList<Car> list = new ArrayList<Car>();
       String query = "select * from cars";
       if(vehicleType!=null){
           query = "select * from cars where VehicleType='"+vehicleType+"'";
       }
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement(query);
        )
        {
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Car c = new Car();
                c.setVehicleNumber(rs.getString("VehicleNumber"));
                c.setVehicleType(rs.getString("VehicleType"));
                c.setModel(rs.getString("Model"));
                c.setSeatingCapacity(rs.getInt("SeatingCapacity"));
                c.setAc(rs.getInt("AC"));
                c.setMusicSystem(rs.getInt("MusicSystem"));
                c.setFixedCharge(rs.getDouble("FixedCharge"));
                c.setFare(rs.getDouble("Fare"));
                c.setPhoto(rs.getString("Photo"));
                list.add(c);
            }
        }
        catch(Exception ex){
            System.out.println("Error addContact : "+ex);
        }
        return list;
    }
    public static Car getCar(String vehicleNumber){
       Car c = new Car();
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("select * from cars where VehicleNumber=?");
        )
        {
            st.setString(1,vehicleNumber);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                c.setVehicleNumber(rs.getString("VehicleNumber"));
                c.setVehicleType(rs.getString("VehicleType"));
                c.setModel(rs.getString("Model"));
                c.setSeatingCapacity(rs.getInt("SeatingCapacity"));
                c.setAc(rs.getInt("AC"));
                c.setMusicSystem(rs.getInt("MusicSystem"));
                c.setFixedCharge(rs.getDouble("FixedCharge"));
                c.setFare(rs.getDouble("Fare"));
                c.setPhoto(rs.getString("Photo"));
            }
        }
        catch(Exception ex){
            System.out.println("Error addContact : "+ex);
        }
        return c;
    }
    public static UserInfo loginUser(String userId, String password){
        UserInfo info = null;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("select * from users where UserId=? and Password = password(?)");
        )
        {
            st.setString(1, userId);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();       //Read
            if(rs.next()){
                info = new UserInfo();
                info.setUserId(rs.getString("UserId"));
                info.setRoleName(rs.getString("RoleName"));
                info.setName(rs.getString("Name"));
                info.setAddress(rs.getString("Address"));
                info.setCity(rs.getString("City"));
                info.setEmail(rs.getString("Email"));
                info.setMobileNumber(rs.getString("MobileNumber"));
                info.setCreditCard(rs.getString("CreditCard"));
            }
        }
        catch(Exception ex){
            System.out.println("Error loginUser : "+ex);
        }
        return info;
    }
    public static boolean isUserExists(String userId){
        boolean status = false;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("select * from users where UserId=?");
        )
        {
            st.setString(1, userId.toLowerCase());
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                status = true;
            }
        }
        catch(Exception ex){
            System.out.println("Error isUserExists : "+ex);
        }
        return status;
    }
    public static String getSecretQuestion(String userId){
        String secretQuestion = null;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("select SecretQuestion from users where UserId=?");
        )
        {
            st.setString(1, userId.toLowerCase());
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                secretQuestion = rs.getString("SecretQuestion");
            }
        }
        catch(Exception ex){
            System.out.println("Error getSecretQuestion : "+ex);
        }
        return secretQuestion;
    }
    public static boolean isAnswerCorrect(String userId, String secretQuestion, String answer){
        boolean status = false;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("select Answer from users where UserId=? and SecretQuestion=?");
        )
        {
            st.setString(1, userId.toLowerCase());
            st.setString(2, secretQuestion);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                String correctAnswer = rs.getString("Answer");
                if(answer.equalsIgnoreCase(correctAnswer)){
                    status=true;
                }
            }
        }
        catch(Exception ex){
            System.out.println("Error isAnswerCorrect : "+ex);
        }
        return status;
    }
    public static String resetPassword(String userId){
        String password = null;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("update users set Password=password(?) where UserId=?");
        )
        {
            password = generatePassword();
            st.setString(1, password);
            st.setString(2, userId.toLowerCase());

            st.executeUpdate();
        }
        catch(Exception ex){
            System.out.println("Error isAnswerCorrect : "+ex);
        }
        return password;
    }
    public static boolean changePassword(String userId, String password){
        boolean status = false;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("update users set Password=password(?) where UserId=?");
        )
        {
            st.setString(1, password);
            st.setString(2, userId.toLowerCase());

            st.executeUpdate();
        }
        catch(Exception ex){
            System.out.println("Error isAnswerCorrect : "+ex);
        }
        return status;
    }
    public static boolean registerUser(UserInfo info){
        boolean status = false;
        try
        (
            Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            PreparedStatement st = con.prepareStatement("insert into users values(?,password(?),?,?,?,?,?,?,?,?,?)");
        )
        {
            st.setString(1, info.getUserId().toLowerCase());
            st.setString(2, info.getPassword());
            st.setString(3, info.getRoleName());
            st.setString(4, info.getSecretQuestion());
            st.setString(5, info.getAnswer());
            st.setString(6, info.getName());
            st.setString(7, info.getEmail());
            st.setString(8, info.getAddress());
            st.setString(9, info.getCity());
            st.setString(10, info.getMobileNumber());
            st.setString(11, info.getCreditCard());
            st.executeUpdate();
            status = true;
        }
        catch(Exception ex){
            System.out.println("Error registerUser : "+ex);
        }
        return status;
    }
    public static String generatePassword(){
        String str = "abcdefghijklmnopqrstuvwxyz0123456789$#@";
        String password = UUID.randomUUID().toString();
        password = password.substring(0,6);
        return password;
    }
}
