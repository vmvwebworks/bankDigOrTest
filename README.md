## **Instructions for  run the test**

> **First them all**
>  I suggest to use rvm or something like avoiding of install anything "globally" and keeping your system clean.
*This test used ruby 2.4.2, Rails 5.2.0 and MySQL as DB.*


 1. Unzip the project / download from Github / create a pull / fork from the project in Github.
 2. Install **Bundler** gem `gem install bundler`.
 3. Run `bundle`command.
 4. Once bundled all, run `rails db:setup`, this will create development and test dbs, tables and seed with bank names, otherwise, simply create dbs yourself, run `rails db:migrate` and `rails db:seed`
**

## Jim and Emma
*Eassely done with rails tasks*

 1. `rails show_me_the_money:create_jim_and_emma`
 2. `rails show_me_the_money:transfer_agent`


**Notes:**

*On the last point, just one of the banks have an history (sender), it's missing the last step.*
This tests includes good practices as:

 - OOP
 - TDD (some, and most on Behaviour)
 - Git (it's my fu****g bread)
 - Clean code & Problem solving (It's ok for me, so also, and of course, it's opinionable).

**About doing this test:**

***I spent a lot of time just on doing this test for yours**, about a week, fulltime and for yours. Time that can be spent on my own projects, for example. As candidate, i expect that yours, understand that this tests show that i have the related skills, if other, can be simply eassely faced and improved if it's needed.*

*At least, please, if finally i'm not "the chosen one" give me good and reasonable reasons for that choice. This will give me the chance for improve my skills and myself.*

*Best regards,
**Marcos***


## **About​ ​This​ ​Test**

The purpose of this code test is to show us your skills in:
• Object Oriented Programming
• TDD
• Clean code
• Git
• Problem solving

> Please keep these aspects in mind as you develop your solution. Also,
> your chosen implementation doesn't necessarily have to be the best you
> can think of, but one that you can implement in the allocated time.

## **Instructions**

• Create a project which models the situation below.
• The language used should be Ruby​ (unless previously agreed otherwise).
• All code should be tested following TDD​.
• A README​ file must be attached explaining your implementation.
• Create a .zip with your code​ and git​ directory.
• Answer our email with the zip​ of the project.

**Background**
*The software you write in this test will be used for banks.*

**Banks have accounts. Accounts hold money. Transfers can be made between accounts. Banks store the history of transfers.**

There can be **two types** of transfers:
• **Intra-bank​ transfers**, between accounts of the same bank. They don't
have commissions, they don't have limits and they always succeed.
• **Inter-bank​ transfers**, between accounts of different banks. They have 5€
commissions, they have a limit of 1000€ per transfer. And they have a 30%
chance of failure.

**Part​ ​1**

Create the models and their relationships to accurately reflect banks, accounts
and transfers. Make sure that new types of accounts and transfers can be added
to the bank with minimal effort.

**Part​ ​2**

After modeling the domain(part 1), create a file called
show_me_the_money.rb*​ in charge of reproducing the next situation:
Jim has an account on the bank A and Emma has an account on the bank B. Jim owes Emma 20000€. Emma is already a bit angry, because she did not get the money although Jim told her that he already sent it. Help Jim send his money by developing a transfer​ ​agent​. This agent assures that everybody gets their money. When the agent receives an order to transfer money from account A to account B, he issues transfers considering commissions, transfer limits and possibility of transfer failures.

The execution of the script will print the balance of every account before and after the transfers and the history of the transfer of every bank.

**Questions:**
Please also supply your answer to the following questions:
• How would you improve your solution?
• How would you adapt your solution if transfers are not instantaneous?
