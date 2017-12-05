def main():
    spam = ['apples', 'bananas', 'tofu', 'cats']
    test = ['oranges', 'tomatoes', 'sushi', 'dogs']

    def printList(lst):
        str = ""
        for i in range(len(lst)):
            if i == len(lst) - 1:
                str = str + ", and " + lst[i]
            elif i == 0:
                str = str + lst[i]
            else:
                str = str + ", " + lst[i]
        print(str)

    printList(spam)
    printList(test)
main()
