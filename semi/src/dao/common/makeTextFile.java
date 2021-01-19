package dao.common;

public class makeTextFile {

	public static void main(String[] args) {
		
		FileDAO fileDAO = new FileDAO();
		
		int num = 0;
		boolean result = true;
		
		result = fileDAO.makeFile(num);
		
		while(!result) {
			num = num + 1;
			result = fileDAO.makeFile(num);
			if(result) {
				break;
			}
		}
	}
}
