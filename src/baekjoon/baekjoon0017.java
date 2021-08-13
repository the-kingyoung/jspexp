package baekjoon;

import java.util.Scanner;

public class baekjoon0017 {
	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		int x = scan.nextInt();

		int count = 0;

		for (int i = 0; i < x; i++) {
			boolean num = true;

			int y = scan.nextInt();

			if (y == 1) {
				continue;
			}
			for (int j = 2; j <= Math.sqrt(y); j++) {
				if (y % j == 0) {
					num = false;
					break;
				}
			}
			if (num) {
				count++;
			}

		}
		System.out.println(count);
	}
}