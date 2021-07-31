package baekjoon;

import java.util.Scanner;

public class baekjoon0007 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		int a = scan.nextInt();
		scan.close();

		for(int i = 0; i <= a; i++) {
			for(int j = i+1; j <= a; j++) {
				System.out.print(" ");
			}
			for(int k = a-i; k <= a; k++) {
				System.out.print("*");
			}
			System.out.println();
		}

	}

}
