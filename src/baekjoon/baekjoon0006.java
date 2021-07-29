package baekjoon;

import java.util.Scanner;

public class baekjoon0006 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		int a = scan.nextInt();
		scan.close();
		int total = 0;

		for (int i = 1; i <= a; i++) {
			total += i;
		}
		System.out.println("1부터 " + a + "까지의 총 합은 " + total);

	}

}
