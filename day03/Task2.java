import java.util.*;

class Task2 {
    static int numOfBits = 12;

    public static int getSumOfBits(Vector<Integer> list, int mask) {
        int sumOfBits = 0;

        for (Integer num : list)
            if ((num & mask) > 0)
                ++sumOfBits;

        return sumOfBits;
    }

    public static void main(String[] args) {
        Scanner reader = new Scanner(System.in);

        Vector<Integer> oxygen = new Vector<Integer>(1000);
        Vector<Integer> co2 = new Vector<Integer>(1000);

        int lineCount = 0;

        int[] sumOfBits = new int[numOfBits];

        while (reader.hasNext()) {
            String line = reader.next();

            oxygen.add(Integer.valueOf(line, 2));
            co2.add(Integer.valueOf(line, 2));
        }

        int mask = 1 << numOfBits - 1;

        while (oxygen.size() > 1) {
            System.out.println(mask);

            Vector<Integer> newOx = new Vector<Integer>();


            boolean keepBit = getSumOfBits(oxygen, mask) >= oxygen.size() / 2.0 ? true : false;

            for (Integer num : oxygen) {

                if ((keepBit && (num & mask) > 0) ||
                    (!keepBit && (num & mask) == 0)) {

                    newOx.add(num);
                }
            }

            oxygen = newOx;
            mask /= 2;
        }

        //System.out.println(oxygen.firstElement());

        mask = 1 << numOfBits - 1;

        while (co2.size() > 1) {

            Vector<Integer> newCo2 = new Vector<Integer>();

            //System.out.println(String.format("\n\nMask:\n%12s\n", Integer.toBinaryString(mask))
                                     //.replace(' ', '0'));

            boolean keepBit = getSumOfBits(oxygen, mask) < oxygen.size() / 2.0 ? true : false;
            //System.out.println(keepBit);

            for (Integer num : co2) {
                if ((keepBit && (num & mask) > 0) || (!keepBit && (num & mask) == 0)) {

                    newCo2.add(num);
                    //System.out.println(String.format("%12s", Integer.toBinaryString(num))
                                             //.replace(' ', '0'));
                }
            }

            co2 = newCo2;
            mask /= 2;
        }

        System.out.println(co2.firstElement() * oxygen.firstElement());

        reader.close();
    }
}
