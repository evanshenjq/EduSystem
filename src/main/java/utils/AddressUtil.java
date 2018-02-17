package utils;

public class AddressUtil {
	
	public static String replaceAddress(String url) {
		StringBuffer buffer=new StringBuffer(url);
		buffer.replace(0, 22, "/home/ftpuser/www");
		String s=buffer.toString().substring(0, 35);
		
		return s;
	}
	
	public static void main(String[] args) {
		String address=AddressUtil.replaceAddress("http://192.168.136.128/files/2017/12/04/3.ai");
		System.out.println(address);
	}

}
