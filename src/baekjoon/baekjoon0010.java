package baekjoon;

import java.util.Scanner;

public class baekjoon0010 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		int[] arr = {scan.nextInt(),scan.nextInt(),scan.nextInt(),
					scan.nextInt(),scan.nextInt(),scan.nextInt(),
					scan.nextInt(),scan.nextInt(),scan.nextInt()};
		
		scan.close();
		
		int count = 0;
		int max = 0;
		int idx = 0;
		
		for(int value : arr) {
			count++;
			
			if(value>max) {
				max=value;
				idx = count;
			}
		}
		System.out.println("최댓값은 "+max+"\n"+idx+"번째 숫자");
		
	}

}
