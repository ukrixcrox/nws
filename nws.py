import newspaper
from newspaper import Article
from rich.markdown import Markdown
from rich.console import Console
from rich.panel import Panel
from rich import print
import sys
import pyfiglet


def main():
    # get newssource
    userurl = input("Enter Newssource url=>https://")
    newsurl = "https://" + userurl

    try:
        # build newssource
        buildarticle = newspaper.build(newsurl, memoize_articles=False)

        # index articles in newssource
        i = 0
        for article in buildarticle.articles:
            print(f"[{i}] {article.url}")
            i += 1
            if i >= 11:
                break

        # get article url
        userarticle = int(input("Enter number of article you want to read=> "))
        print("\n")
        article = buildarticle.articles[userarticle]

        # download and parse article
        article = Article(article.url)
        article.download()
        article.parse()

        # display article publish date, title and text
        console = Console()
        console.print(Markdown(f"#### {article.publish_date}"))
        console.print(Markdown(f"# {article.title}"))
        console.print(Panel(article.text))

    except KeyboardInterrupt:
        sys.exit(0)


if __name__ == "__main__":
    banner = pyfiglet.figlet_format("N W S")
    print(banner)
    main()
