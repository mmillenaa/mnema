# Security Policy

## Context
Mnema 1.0 is an R (Shiny) web application hosted on the shinyapps.io platform. The application processes user inputs to generate structured datasets (.xlsx) and batch execution scripts (.bat). It does not permanently store uploaded user data or metadata on the server.

## Safe Execution of Generated Scripts
A core feature of this application is generating `.bat` (batch) files for renaming local digital archives. 
* **User Responsibility:** Users are strongly advised to open and inspect the generated `.bat` scripts in a standard text editor (such as Notepad) to verify the renaming paths before executing them on their local machines.
* **No Malicious Payloads:** The application generates plain text commands strictly based on the user's interface inputs and archival standards.

## Reporting a Vulnerability
If you discover a security vulnerability—such as an injection flaw in the script generation or a dependency issue within the R/JavaScript/Python environment—please report it privately.

1. **GitHub Private Reporting:** Go to the Security tab → Report a vulnerability.
2. **Email:** Send a message directly to millena@usp.br.

Please provide a detailed description of the issue and steps to reproduce it. You will receive an acknowledgment within ten working days. Do not open a public issue for security concerns.
