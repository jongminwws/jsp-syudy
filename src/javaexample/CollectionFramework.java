package javaexample;

import java.util.ArrayList;
import java.util.HashMap;

public class CollectionFramework {
	@SuppressWarnings("unused")
	private static void main(String[] args) {
//		String[] list1 =new String[10];
//		list1[0] = "java";
//		list1[1] = "jdbc";
//		list1[2] = "jsp";
//		list1[3] = "database";
//		for(int i=0;i<list1.hashCode();i++) {
//			if(list1[i]==null) {
//				break;
//			}
//			System.out.println(list1[i]);
//		}
		
		//동적배열 array list
		ArrayList<String> list2 = new ArrayList<String>();
		list2.add("java");
		list2.add("jdbc");
		list2.add("jsp");
		list2.add("database");
		
		for(int i=0; i<list2.size();i++) {
			System.out.println(list2.get(i));
		}
		
		//동적배열(hashmap)
		HashMap<String, Integer> list3 =new HashMap<String, Integer> ();
		list3.put("정자바", 95);
		list3.put("홍길동", 85);
		list3.put("이몽룡", 90);
		list3.put("춘향이", 78);
		
		System.out.println(list3.get("홍길동"));
	}
}
