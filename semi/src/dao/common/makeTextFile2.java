package dao.common;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public class makeTextFile2 {
	
	public static void main(String args[]) {
		String hangle[] = {"가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"};
		
		String fileDir = "D:\\filedir\\";
		
		String fileName = fileDir + "";
		
		Calendar cal = Calendar.getInstance();
		
		
		String year = Integer.toString(cal.get(Calendar.YEAR));
		String month = Integer.toString(cal.get(Calendar.MONTH)+1);
		String day = Integer.toString(cal.get(Calendar.DATE));
		
		if(month.length() == 1) {
			month = "0" + month;
		}
		
		String nowtime = year + month + day;
		
		int num = 0;
		
		File chkFile= new File(fileDir + nowtime + "_" + num + ".txt");
		
		if(chkFile.exists()) {
			System.out.println("파일존재");
		}else {
			System.out.println("파일존재x");
			fileName = fileDir + nowtime + "_" + num + ".txt";				
			
			try {
				
				System.out.println(fileName);
				
				//BufferedWriter와 FileWriter를 조합하여 사용 (속도 상승)
				BufferedWriter fw = new BufferedWriter(new FileWriter(fileName, true));
				
				//파일안에 문자열 쓰기
				for(int i=0; i < hangle.length; i++) {
					fw.write(hangle[i] + "\r\n"); 
				}
				System.out.println("fileName : " + fileName);
				
				fw.flush();
				
				//객체 닫기
				fw.close();
				System.out.println("파일 생성 성공");
				
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("파일 생성 실패");
			}
		}
		
		
	}
}
