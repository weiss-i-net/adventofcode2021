import java.util.*;

class Task2alt {
    static int numOfBits = 12;
    static int maxLen = 2000;

    public static int getCountOf0s(int[] sortedList, int start, int end, int mask) {
        int count = 0;

        for (int i = start; (sortedList[i] & mask) == 0 && i < end; ++i)
            ++count;

        return count;
    }

    public static void main(String[] args) {
        Scanner reader = new Scanner(System.in);

        int[] data = new int[maxLen];

        int size = 0;

        while (reader.hasNext()) {
            String line = reader.next();
            data[size++] = Integer.parseInt(line, 2);
        }
        reader.close();

        Arrays.sort(data, 0, size);

        int start = 0;
        int end = size;
        int len = end - start;

        int mask = 1 << numOfBits - 1;
        while (len > 1) {

            int num0s = getCountOf0s(data, start, end, mask);


            //System.out.println("0s: " + num0s + "  start: " + start + "  end: " + end);

            if (num0s <= len / 2)
                start += num0s;
            else
                end = start + num0s;

            mask = mask >> 1;
            len = end - start;

        }
        //System.out.println("  start: " + start + "  end: " + end + "  num: " + data[start]);
        int ox = data[start];

        start = 0;
        end = size;
        len = end - start;

        mask = 1 << numOfBits - 1;
        while (len > 1) {

            int num0s = getCountOf0s(data, start, end, mask);

            if (num0s > len / 2)
                start += num0s;
            else
                end = start + num0s;

            mask = mask >> 1;
            len = end - start;
        }
        int co = data[start];

        System.out.println(ox*co);

    }

}
