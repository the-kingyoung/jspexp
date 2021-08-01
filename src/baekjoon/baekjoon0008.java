package baekjoon;

import java.util.Scanner;

public class baekjoon0008 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		while(true) {
			int a = scan.nextInt();
			int b = scan.nextInt();
			
			if(a==0 && b==0) {
				scan.close();
				System.out.println("계산이 종료됩니다.");
				break;
			}
			System.out.println("정답은 "+(a+b)+"입니다.");		
			System.out.println("0, 0 을 입력 시 종료됩니다.");
		}
		
		


	}

}