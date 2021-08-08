package baekjoon;

import java.util.Scanner;

public class baekjoon0015 {
	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		
		int x = scan.nextInt();
		int y = scan.nextInt();
		
		scan.close();
		
		if(x>0 && y>0) {
			System.out.println("1사분면 입니다.");
		}else if(x<0 && y>0) {
			System.out.println("2사분면 입니다.");
		}else if(x<0 && y<0) {
			System.out.println("3사분면 입니다.");
		}else if(x>0 && y<0) {
			System.out.println("4사분면 입니다.");
		}else {
			System.out.println("값을 다시 입력해주세요");
		}
		
	}
}