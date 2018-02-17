package utils;

import java.util.Random;
import java.util.UUID;

/**
 * ����id���ɲ���
 * <p>Title: IDUtils</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	������
 * @date	2015��7��22������2:32:10
 * @version 1.0
 */
public class IDUtils {

	/**
	 * ͼƬ������
	 */
	public static String genImageName() {
		//ȡ��ǰʱ��ĳ�����ֵ��������
		long millis = System.currentTimeMillis();
		//long millis = System.nanoTime();
		//������λ�����
		Random random = new Random();
		int end3 = random.nextInt(999);
		//���������λǰ�油0
		String str = millis + String.format("%03d", end3);
		
		return str;
	}
	
	/**
	 * ��Ʒid����
	 */
	public static long genRandomId() {
		//ȡ��ǰʱ��ĳ�����ֵ��������
		long millis = System.currentTimeMillis();
		//long millis = System.nanoTime();
		//������λ�����
		Random random = new Random();
		int end2 = random.nextInt(99);
		//���������λǰ�油0
		String str = millis + String.format("%02d", end2);
		long id = new Long(str);
		return id;
	}
	
	public static String getStringId() {
		//�����ȡUserID
		UUID uuid=UUID.randomUUID();
		String userId=uuid.toString().substring(2, 17);
		return userId;
	}
	
	public static void main(String[] args) {
		for(int i=0;i< 100;i++)
		System.out.println(genRandomId());
	}
}
