package baekjoon;

import java.util.Scanner;

public class baekjoon0003 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		int n = scan.nextInt();
		
		scan.close();
		
		for(int i=1; i<10; i++) {
			System.out.println(n+"X"+i+"="+(n*i));
		}
	}

}
