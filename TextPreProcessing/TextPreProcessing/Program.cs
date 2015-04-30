using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace TextPreProcessing
{
    class Program
    {
        static void Main(string[] args)
        {
            string Title = "Tweets";
            
            // Load Text File
            FileStream TextFile = new FileStream(Title, FileMode.Open);
            StreamReader TextReader = new StreamReader(TextFile);
            TextReader.BaseStream.Seek(0, SeekOrigin.Begin);

            int NumOfTweets = 5000;
            int NumOfCatTweets = 1000;

            string[] text = new string[NumOfTweets];
            for (int i = 0; i < NumOfTweets; i++)
                text[i] = TextReader.ReadLine();


            TextReader.Close();
            TextReader.Dispose();

            // Load Freq Dictionary
            Dictionary<string, int> OurDict = new Dictionary<string, int>();
            Dictionary<string, int> FreqDict = new Dictionary<string, int>();
            FileStream FreqDictFile = new FileStream("FreqDict", FileMode.Open);
            StreamReader FreqDictReader = new StreamReader(FreqDictFile);
            FreqDictReader.BaseStream.Seek(0, SeekOrigin.Begin);
            int NumOfFreqWord = int.Parse(FreqDictReader.ReadLine());
            for (int i = 0; i < NumOfFreqWord; i++)
                FreqDict.Add(FreqDictReader.ReadLine(), 1);

            FreqDictReader.Close();
            FreqDictReader.Dispose();

            int[] TotalNumWord = new int[NumOfTweets];

            for (int i = 0; i < NumOfTweets; i++)
            {
                // Remove http parts
                if (text[i].IndexOf("http", 0) != -1)
                    text[i] = text[i].Substring(0, text[i].IndexOf("http", 0));

                // Remove # parts
                for (int j = 0; j < text[i].Length; j++)
                    if (text[i][j] == '#')
                        text[i] = text[i].Remove(j, 1).Insert(j, " ");
                
                // Lowercase
                text[i] = text[i].ToLower();

                // Add every "non-frequent" word to the dictionary and Count the number of words in this text
                string word = "";
                int Num = 0;
                for (int j = 0; j < text[i].Length; j++)
                    if (text[i][j] >= 'a' && text[i][j] <= 'z' || text[i][j] == '\'')
                        word = word + text[i][j];
                    else if (word != "")
                    {
                        if (!FreqDict.ContainsKey(word) && !OurDict.ContainsKey(word))
                            OurDict.Add(word, 1);
                        word = "";
                        Num++;
                    }
                if (word != "")
                    Num++;
                if (word != "" && !FreqDict.ContainsKey(word) && !OurDict.ContainsKey(word))
                    OurDict.Add(word, 1);
                TotalNumWord[i] = Num;
            }

            // Output our Dictionary
            FileStream FeatureFile = new FileStream("FeatureWord", FileMode.Create);
            StreamWriter FeatureWriter = new StreamWriter(FeatureFile);
            FeatureWriter.WriteLine(OurDict.Count);
            foreach (var key in OurDict.Keys)
                FeatureWriter.WriteLine(key);
            FeatureWriter.Flush();
            FeatureWriter.Close();
            FeatureFile.Close();

            // Output 0-1 Matrix and Freq Matrix
            FileStream Matrix01File = new FileStream("0-1Matrix.csv", FileMode.Create);
            StreamWriter Matrix01Writer = new StreamWriter(Matrix01File);
            FileStream MatrixFreqFile = new FileStream("FreqMatrix.csv", FileMode.Create);
            StreamWriter MatrixFreqWriter = new StreamWriter(MatrixFreqFile);
            int label;

            for (int i = 0; i < NumOfTweets; i++)
            {
                foreach (var key in OurDict.Keys)
                {
                    int count = 0;
                    foreach (Match match in Regex.Matches(text[i], key))
                        count++;
                    if (count > 0)
                        Matrix01Writer.Write("1,");
                    else
                        Matrix01Writer.Write("0,");
                    MatrixFreqWriter.Write(count * 1.0 / TotalNumWord[i] + ",");
                }
                label = i / NumOfCatTweets + 1;
                MatrixFreqWriter.WriteLine(label);
                Matrix01Writer.WriteLine(label);
            }

            Matrix01Writer.Flush();
            Matrix01Writer.Close();
            Matrix01File.Close();
            MatrixFreqWriter.Flush();
            MatrixFreqWriter.Close();
            MatrixFreqFile.Close();
        }
    }
}
