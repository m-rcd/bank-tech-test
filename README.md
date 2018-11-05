# Bank tech test

[Motivation](#motivation) | [Build status](#build-status) | [Technologies](#technologies) | [User Stories](#user-stories) | [Running the App](#running-the-app) | [Running tests](#running-tests) | [Contributing](#contributing)

----
A simple command-line banking application done in Ruby using Object Oriented Design(OOD) and Test driven development(TDD).

##  <a name="motivation">**Motivation**</a>

This project was created for a technical test challenge at Makers Academy.

##  <a name="build-status">**Build Status**</a>

##  <a name="technologies">**Technologies**</a>

- Ruby
- RSpec

##  <a name="user-stories">**User stories**</a>

```
As a user
So that I can save money
I can deposit money in my account
```

```
As a user
So that I can spend money
I can withdraw money from my account
```

```
As a user
So that I can check my account history
I can print a statement showing all my transactions
```


##  <a name="running-the-app">**Running the app**</a>

- Clone this repository

- In the command line, run `pry` or `irb`

- Require code files:

  - `require './lib/account.rb'`

  - `require './lib/statement.rb'`

- Create a new account

  - `account = Account.new`

- Deposit money in your account

  - `account.deposit(1000)`

  - `account.deposit(2000)`

- Withdraw money from your account

  - `account.withdraw(500)`

- Print an account statement to see all your transactions
  - `account.get_statement`

  Here is an example:

  (To be added)


##  <a name="running-tests">**Running tests**</a>

Run `rspec` in your terminal

(screenshot of tests to be added)

##  <a name="contributing">**Contributing**</a>

Pull Requests are always welcome.

When you edit the code, please run bundle exec rspec to check all the tests pass.
Also run the linter rubocop to formatting of your code before you git commit.

Ensure the PR description clearly describes the problem and solution. It should include the relevant issue number, if applicable.
