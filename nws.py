import newspaper
from newspaper import Article
import re
import pyfiglet

banner = pyfiglet.figlet_format("News scraper")
print(banner)

#prints examples of newswebsites 
print("Examples: ")
print()
ex = newspaper.popular_urls()
print(*ex, sep="    ")
print('\n')


#creates a newspaper from a newswebsite and prints the article url's in the newswebsite out
try:
    i2 = input("Enter news website=> ")

    news = newspaper.build(i2, memoize_articles=False)

    for article in news.articles:
        print(article.url)

except KeyboardInterrupt:
    print()
    print("==> User KeyboardInterrupt")
    exit(0)

except:
    pattern = r'^http[ ,s]://.$'
    a = re.match(pattern, i2)
    i2 != a
    print()
    print("==> Error: This is not an url")
    exit(0)


#Takes a news article url as input and displays information see below
try:
    i = input("Enter news article url=> ")

    url = i

    article=Article(url)

    article.download()
    article.parse()
    article.nlp()

except KeyboardInterrupt:
    print()
    print("==> User KeyboardInterrupt")
    exit(0)
#checks for a valid url per pattern
except:
    pattern = r'^http[ ,s]://.$'
    a = re.match(pattern, i)
    i != a
    print()
    print("==> Error: This is not an url")
    exit(0)

#the article title
a = article.title
print()
print("-"*40,"Title","-"*40)
print()
print(a)


#prints the articles authors
a1 = article.authors

print()
print("-"*40,"Authors","-"*40)
print()
print(*a1, sep="    ")
print()

#prints the articles publish date except if there is none
a2 = article.publish_date

if a2 != None:
    print()
    print("-"*40, "Publishdate")
    print()
    print(a2)
    print()
else:
    pass

#prints an article summary 
a3 = article.summary
print("-"*40,"Article-Summary","-"*40)
print()
print(a3)
print()

#the full article text
a4 = article.text
print("-"*40,"Full Text","-"*40)
print()
print(a4)
print()
print("-"*97)