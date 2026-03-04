# Demoblaze Automation (Robot Framework)

This repository contains a Robot Framework test suite for the [Demoblaze](https://www.demoblaze.com/) demo web store.

## Features

- Login / Logout flows
- User signup
- Shopping / add-to-cart and checkout scenarios
- Centralized keywords and resource files for reusable test steps

## Tech stack

- Robot Framework
- Selenium (used via Robot Framework libraries)
- Python (for environment management)

## Repository structure

- `resources/` - Robot Framework resource files and page-object style keywords
- `variables/` - project variables
- `tests/` - Robot Framework test suites (login, logout, shopping, signup)
