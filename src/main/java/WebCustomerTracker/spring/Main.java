package WebCustomerTracker.spring;

import java.util.*;

class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
        String[] arr1 = {"a", "b", "x"};
        String[] arr2 = {"g", "v", "d"};
        System.out.println(hasPairWithSum(Arrays.asList(arr1), Arrays.asList(arr2)));
    }

    static boolean hasPairWithSum(String[] array, String[] arr2) {
        Map<String,Boolean> map = new HashMap<>();
        for (String s : array) {
            if (!map.containsKey(s)){
                map.put(s,true);
                System.out.println(map);
            }
        }
        for (String s : arr2) {
            if (map.containsKey(s)) {
                return true;
            }
        }
       return false;
    }


    static boolean hasPairWithSum(List<String> array, List<String> arr2) {

        return array.stream().anyMatch(arr2::contains);

    }

}
