package baekjoon;

import java.util.Scanner;

public class baekjoon0021 {
	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		String str = scan.next().toUpperCase();

		int[] arr = new int[26];
		
		for(int i = 0; i < str.length(); i++) {
			int num = str.charAt(i)-'A';
			arr[num]++;
		}
		
		int max = 0;
		char answer = '?';
		for(int i = 0; i<arr.length; i++) {
			if(max<arr[i]) {
				max = arr[i];
				answer = (char)(i+'A');
			}else if(max == arr[i]) {
				answer = '?';
			}
		}
		System.out.println(answer);
	}
}