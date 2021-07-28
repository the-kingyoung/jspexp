package baekjoon;

import java.util.Scanner;

public class baekjoon0004 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		int H = scan.nextInt();
		int M = scan.nextInt();

		scan.close();

		if (M < 45) {
			H--;
			M = 60 - (45 - M);

			if (H < 0) {
				H = 23;
			}
			System.out.println(H + ":" + M);
		} else {
			System.out.println(H + ":" + (M - 45));
		}

	}

}
