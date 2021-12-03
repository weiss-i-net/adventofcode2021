import java.util.*;

class Task1 {
    public static void main(String[] args) {
        Scanner reader = new Scanner(System.in);
        int[] sumOfBits = new int[12];
        int lineCount = 0;

        while (reader.hasNext()) {
            char[] line = reader.next().toCharArray();

            Arrays.setAll(sumOfBits, i -> sumOfBits[i] + line[i] - '0');

            ++lineCount;
        }

        int gammaRate = 0;

        for (int i = 0; i < 12; ++i) {
            gammaRate *= 2;
            if (sumOfBits[i] > lineCount / 2)
                ++gammaRate;
        }

        System.out.println(gammaRate * (~gammaRate & (1 << 12) - 1));

        reader.close();
    }
}
