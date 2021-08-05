package baekjoon;

import java.util.Scanner;

public class baekjoon0012 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		int num = scan.nextInt();
		scan.close();

		int a = 0;
		int b = num;

		while (true) {
			num = ((num % 10) * 10) + (((num / 10) + (num % 10)) % 10);
			a++;

			if (b == num) {
				break;
			}
		}
		System.out.println(a + "번째 만에 나옴");
	}
}