
import java.io.IOException;
import java.sql.*;
import java.util.TimerTask;
import java.util.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import dbconn.*;


public class Url_checking extends TimerTask {

    int pub_id;
    public HashSet<String> l2 = new HashSet<>();

    Url_checking(int id) {
        pub_id = id;
    }

    @Override
    public void run() {
        System.out.println("1: " + l2);
        l2.clear();
        int id = 0;
        ResultSet rs = null;
		try (Connection connection = new DataSourceConnection().getConnection();
				PreparedStatement ps = connection
						.prepareStatement("Select site_name from monitor where userid = ?")) {
			ps.setInt(1, pub_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String dup = rs.getString("site_name");
                l2.add(dup);
            }
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
        }

        System.out.println("l2 : " + l2);
        System.out.println("");
        String test = "";
        for (String s : l2) {

            test = s;
            System.out.println("TEST URL : " + test);
            boolean check = true;
            String suc_staus = "SUCCESS";
            String fail_status = "FAILURE";
            long start = 0;
            long finish = 0;
            try {
                Timestamp timestamp1 = new Timestamp(System.currentTimeMillis());
                System.out.println(timestamp1);
                URL url = (URL) new URL(test.trim());
                HttpURLConnection httpUrlConnect = (HttpURLConnection) url.openConnection();
                httpUrlConnect.setConnectTimeout(5000);
                start = System.currentTimeMillis();
                httpUrlConnect.connect();
                if (httpUrlConnect.getResponseCode() == 200) {
                    finish = System.currentTimeMillis();
                    System.out.println(test + " - " + httpUrlConnect.getResponseMessage() + " took " + (finish - start) + " Milli Seconds.");
                } else {
                    check = false;
                }
                if (httpUrlConnect.getResponseCode() == HttpURLConnection.HTTP_NOT_FOUND) {
                    check = false;
                    System.out.println(test + " - " + httpUrlConnect.getResponseMessage() + " - " + HttpURLConnection.HTTP_NOT_FOUND);
                }
            } catch (IOException e) {
                System.out.println(e);
            }
            long res = finish - start;
            System.out.println("Total Time for page load - " + (finish - start));
            long res1 = (long) res;
            //res1 = res1 / 1000;
            String status = "";
            if (res1 > 1 || res1 < 0) {
                if (res1 < 0 || check == false) {
                    res1 = 0;
                    status = fail_status;
                    System.out.println("STATUS : " + fail_status);
                } else {
                    status = suc_staus;
                    System.out.println("STATUS : " + suc_staus);
                }
            }
    		try (Connection connection = new DataSourceConnection().getConnection();
    				PreparedStatement ps = connection
    						.prepareStatement("insert into monitor_application(userid,site_name,status,milliseconds,seconds) values(?,?,?,?,?)")) {
                ps.setInt(1, pub_id);
                ps.setString(2, test);
                ps.setString(3, status);
                ps.setLong(4, res);
                ps.setDouble(5, res1);
                int j = ps.executeUpdate();
                PreparedStatement ps2 = connection.prepareStatement("update monitor set last_updated=? where site_name=?");
                Timestamp timestamp2 = new Timestamp(System.currentTimeMillis());
                ps2.setTimestamp(1, timestamp2);
                ps2.setString(2, test);
                int k = ps.executeUpdate();
                System.out.println("");
                System.out.println("");
            } catch (ClassNotFoundException | SQLException e) {
                System.out.println(e);
            }
        }
    }
}
