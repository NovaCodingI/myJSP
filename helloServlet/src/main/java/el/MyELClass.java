package el;

public class MyELClass {

	public MyELClass() {
		// TODO Auto-generated constructor stub
	}
	
	// 주민번호를 입력받아 성별을 반환 하는 메소드
	// 001225-3000000
	// 001225-2000000
	// 문자열 입력받아서 문자열
	public static String getGender(String jumin) {
		String res = "";
		try {
        	// 문자열의 위치 확인
        	// System.out.println(str.indexOf("-")+1);
        	int startIndex = jumin.indexOf("-") + 1;
        	int endIndex = startIndex + 1;
        	String gender = jumin.substring(startIndex, endIndex);
        	if(gender.equals("1") || gender.equals("3")) {
        		res = "남자";
        	} else if(gender.equals("2") || gender.equals("4")) {
        		res = "여자";
        	} else {
        		// 예외를 발생
        		// throw new Exception();
        		res = "주민등록 번호를 확인해주세요";
        	}
		} catch (Exception e) {
			// TODO: handle exception
			res = "주민등록 번호를 확인해주세요";
		}
		return res;
	}
		/* GPT
		 if (jumin != null && jumin.length() == 13) {
	            char genderCode = jumin.charAt(6);
	            
	            if (genderCode == '1' || genderCode == '3') {
	                res = "남성";
	            } else if (genderCode == '2' || genderCode == '4') {
	                res = "여성";
	            }
	        }
		*/
			
	
	
	// 입력받은 문자열이 숫자인지 판별하는 정적메소드
	public static boolean isNumber(String value) {
		/*
		try {
			Integer.parseInt(value);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		} 
		 */
		// 입력된 문자열을 char배열로 변환
		char[] chArr = value.toCharArray();
		        
	        for(int i=0; i<chArr.length; i++) {
	        	// 문자가 포함되어 있으면 return false;
	        	// System.out.println(chArr[i]);
	        	// 48-57
	        	if(!(chArr[i] >= '0' && chArr[i] <= '9')) {
	        		return false;
	        	} 
	        }
	        return true;
		}
			
		
		/* GPT
		if (value == null || value.isEmpty()) {
            return false;
        }
        
        for (char c : value.toCharArray()) {
            if (!Character.isDigit(c)) {
                return false;
            }
        }
		*/
		
		
	
	// 입력받은 정수까지 구구단을 HTML 테이블로 출력 정적메소드
	// 1~압력받은 단까지 출력 → 
	public static String showGugudan(int limitDan) {
		// 내부적으로 문자열을 더할때마다 메모리에 새로운 공간을 만들게됩니다.
		// + 연산자를 사용하여 문자열을 연결할 경우 메모리의 낭비가 심합니다.
		// String str = "" + "";
		
		// 객체 타입이라 생성해야해요
		StringBuffer sb = new StringBuffer();
		sb.append("<table border='1'>");
		for(int dan=2; dan<=limitDan; dan++) {
			sb.append("<tr>");
			for(int i=1; i<=9; i++) {
				sb.append("<td>");
				sb.append(dan + " * " + i + " =  " + (dan*i));
				sb.append("</td>");
			}
			sb.append("</tr>");
		}
		sb.append("</table>");
        // sb.toString()하면 문자열로 반환합니다.
        return sb.toString();
	}
	/* GPT
        StringBuilder res = new StringBuilder();
        res.append("<table border='1'>");
        
        for (int dan = 1; dan <= limitDan; dan++) {
            res.append("<tr><td colspan=\"2\"><b>" + dan + "단</b></td></tr>");
            
            for (int i = 1; i <= 9; i++) {
                res.append("<tr><td>" + dan + " * " + i + "</td><td>" + (dan * i) + "</td></tr>");
            }
        }
        
        res.append("</table>");
	 */
	
	public static void main(String[] args) {
			/* GPT
			String jumin = "주민번호 입력"; // 실제 주민번호를 입력해야 합니다.
	        int limitDan = 9; // 출력할 구구단의 최대 단을 지정합니다.

	        // 성별 출력
	        String gender = MyELClass.getGender(jumin);
	        System.out.println("성별: " + gender);

	        // 숫자 판별
	        String value = "12345"; // 숫자인지 판별할 문자열
	        boolean isNumber = MyELClass.isNumber(value);
	        System.out.println(value + "은 숫자인가? " + isNumber);

	        // 구구단 출력
	        String gugudanTable = MyELClass.showGugudan(limitDan);
	        System.out.println(gugudanTable);
	        */
		
			
	        MyELClass el = new MyELClass();
	        System.out.println( el.getGender("001225-2000000") );

	        /*
	        // 시작인덱스(포함), 끝인덱스(불포함)
	        // System.out.println(str.substring(7,8)); // Test
	        try {
	        	// 문자열의 위치 확인
	        	System.out.println(str.indexOf("-")+1);
	        	int startIndex = str.indexOf("-") + 1;
	        	int endIndex = startIndex + 1;
	        	String gender = str.substring(startIndex, endIndex);
	        	if(gender.equals("1") || gender.equals("3")) {
	        		System.out.println("남자");
	        	} else if(gender.equals("2") || gender.equals("4")) {
	        		System.out.println("여자");
	        	} else {
	        		System.out.println("주민등록 번호를 확인 해주세요!");
	        	}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("주민등록 번호를 확인 해주세요!");
			}
			*/
	        
	        System.out.println( MyELClass.isNumber("123a"));
	        
	        /*
	        String str ="a1234";
	        char c = '0';
	        char cc = '9';
	        
	        System.out.println("0 : " + (int)c);
	        System.out.println("9 : " + (int)cc);
	        
	        char[] chArr = str.toCharArray();
	        
	        for(int i=0; i<chArr.length; i++) {
	        	// 문자가 포함되어 있으면 return false;
	        	System.out.println(chArr[i]);
	        	if(!(chArr[i] >= '0' && chArr[i] <= '9')) {
	        		System.out.println("문자가 포함되어 있습니다.");
	        	} else {
	        		System.out.println("숫자입니다.");
	        	}
	        
	        }
	        */
	        
	        System.out.println(MyELClass.showGugudan(2));
	        
	        
	        
	    }
	}


