package baekjoon;

import java.util.Scanner;

public class baekjoon0023 {
	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		while (true) {
			int x = scan.nextInt();
			int y = scan.nextInt();
			int z = scan.nextInt();

			if (x == 0 && y == 0 && z == 0)
				break;

			if ((x * x) + (y * y) == (z * z)) {
				System.out.println("직각삼각형입니다.");
			} else if ((x * x) == (y * y) + (z * z)) {
				System.out.println("직각삼각형입니다.");
			} else if ((y * y) == (x * x) + (z * z)) {
				System.out.println("직각삼각형입니다.");
			} else {
				System.out.println("직각삼각형이 아닙니다.");
			}
		}

	}
}