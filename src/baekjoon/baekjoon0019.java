package baekjoon;

import java.util.Scanner;

public class baekjoon0019 {
	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		int n = scan.nextInt();
		
		System.out.println(fibona(n));
		
	}
	
	public static int fibona(int n) {
		if(n<=1)
			return n;
		else
			return fibona(n-2)+fibona(n-1);
	}
}