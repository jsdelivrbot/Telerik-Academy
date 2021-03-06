﻿namespace NumberOfAlbumsOfAuthor2
{
    using System;
    using System.Collections.Generic;
    using System.Xml;

    class Program
    {
        static void Main(string[] args)
        {
            XmlDocument document = new XmlDocument();
            document.Load("..\\..\\..\\catalog.xml");
            Dictionary<string, int> authors = new Dictionary<string, int>();

            foreach (XmlElement artistElement in document.SelectNodes("albums//artist"))
            {
                string artist = artistElement.InnerText;

                int countOfAlbums = 0;
                authors.TryGetValue(artist, out countOfAlbums);
                authors[artist] = ++countOfAlbums;
            }

            foreach (var kv in authors)
            {
                Console.WriteLine(kv.Value);
            }
        }
    }
}
