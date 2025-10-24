Tables = regex "(?is)<table(.*?)</table>"
TableRows = rows pick 1 regex "(?is)<tr[^>]*>(.*?)</tr>" 
TableHeaders = rows pick 1 regex "(?is)<th[^>]*>(.*?)</th>" un box first first
TableData = rows pick 1 regex "(?is)<td[^>]*>(.*?)</td>"

BoxToString = reduce content (join join) @,
BoxToLines = reduce content (join join) @\n

TableToCSV! = (
        drop 1 inv TableData TableRows first ^
        uncsv join $"_\n" BoxToString TableHeaders TableRows un box first ^ BoxToLines inv BoxToString
# Broken down macro
# Headers = TableHeaders TableRows un box first Prods
# Data = drop 1 inv TableData TableRows first Prods
# CSVTable = uncsv join $"_,\n" BoxToString Headers BoxToLines inv BoxToString Data
)





