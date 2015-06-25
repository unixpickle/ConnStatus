# ConnStatus

This app adds a status item to your OS X status bar which smiles if you're connected to the internet and frowns otherwise.

# How it works

ConnStatus pings google.com once per second. If the ping times out \(takes more than a second\), the computer is considered offline until the next ping succeeds.
