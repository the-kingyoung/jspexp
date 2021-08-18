package baekjoon;

import java.util.Scanner;

public class baekjoon0022 {
	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
	
		int year = scan.nextInt();
		scan.close();
		
		if(year%4==0) {
			if(year%400==0) System.out.println("1");
			else if(year%100==0) System.out.println("0");
			else System.out.println("1");
		}
		else System.out.println("0");
	}
}