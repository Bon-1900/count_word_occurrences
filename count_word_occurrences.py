from docx import Document
from collections import Counter
import re
from tabulate import tabulate
import sys

def count_word_occurrences(doc_path):
    doc = Document(doc_path)
    text = ' '.join([p.text for p in doc.paragraphs])
    words = re.findall(r'\b\w+\b', text.lower())  # Use regex to split text into words
    word_count = Counter(words)
    return word_count

def print_word_occurrences_table(word_occurrences):
    sorted_word_occurrences = dict(sorted(word_occurrences.items(), key=lambda item: item[1], reverse=True))
    table_data = []
    for word, count in sorted_word_occurrences.items():
        table_data.append([word, count])

    headers = ["Word", "Occurrences"]
    print(tabulate(table_data, headers=headers, tablefmt="grid"))

def main():
    if len(sys.argv) < 2:
        print("Usage: python count_word_occurrences.py <input>")
        return

    file_path = sys.argv[1]
    print("Input:", file_path)

    try:
        word_occurrences = count_word_occurrences(file_path)
        print_word_occurrences_table(word_occurrences)
    except:
        print(f"\ndocx.opc.exceptions.PackageNotFoundError: Package not found at '{file_path}'")

if __name__ == "__main__":
    main()