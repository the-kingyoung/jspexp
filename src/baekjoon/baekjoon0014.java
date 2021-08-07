package baekjoon;

import java.util.Scanner;

public class baekjoon0014 {
	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		int a = scan.nextInt();  // 고정비용
		int b = scan.nextInt();  // 가변비용
		int c = scan.nextInt();  // 상품가격
		
		if( c<=b ) {
			System.out.println("-1");
		}else {
			System.out.println((a/(c-b))+1);
		}
		
	}
}