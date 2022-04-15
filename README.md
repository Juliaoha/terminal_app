# terminal_app

Walkthrough:

Project Mim (a figure in Norse mythology, renowned for his knowledge and wisdom)

A terminal app that allows the user to create a glossary of words, terms, phrases and acronyms for themselves. A user can create a new term, look up saved terms and group them based on their category. A user also has an option to create more categories.

The terms that have been created will persist even when the app is closed down and rebooted. The terms can be written to a pdf/text.

Architecture:

Classes & instance variables:

    - Term:
        - @name, @sub_name(optional), @description, @references, @category, @@total_terms
    - Category:
        - @name, @@total_terms
    - InputOutput:
        - The job of the class is to read input and display anything that appears in the terminal.
    - ReadWrite:
        -
    - TextWriter
        -
