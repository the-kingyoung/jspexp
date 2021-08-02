package baekjoon;

import java.util.Arrays;
import java.util.Scanner;

public class baekjoon0009 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		int a = scan.nextInt();
		int[] array = new int[a]; // 배열의 갯수를 정해준다.

		for (int i = 0; i < a; i++) {
			array[i] = scan.nextInt(); // 배열에 입력받은 값을 넣어준다.
		}

		scan.close();
		Arrays.sort(array);
		System.out.println("최소값 : " + array[0] + "\n최대값 : " + array[a - 1]);

	}

}