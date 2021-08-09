package baekjoon;

import java.util.Scanner;

public class baekjoon0016 {
	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		
		int x = scan.nextInt();
		
		scan.close();
		
		int fac = 1;
		
		while(x != 0) {
			fac = fac*x;
			x--;
		}
		System.out.println(fac);
		
	}
}