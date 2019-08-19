# README

1 – Test Case Exercise. 
Expect this exercise to take no more than 15-30 mins

Evernote, (https://evernote.com/), a month away from their “Go LIVE” date realized that although they had written some automated tests they were still unclear about the quality of their product, they decided to hire QA. The available functionalities at the time you joined were just the following:

Ability for a single user to share their notes across multiple different devices, no document sharing between different users.

write test cases for the application, no need to write out all similar type cases, just make note that there are more, eg repeat for each XYZ. Expecting a high level listing of areas to test not detailed Test Cases.
specify what you would do first to get an idea of how buggy the application might be

Answer:
As stated the product would support only basic text editor functions (create, read, update, and delete, no font selection and so on), combined with sharing across devices. I would clarify with the team if this accurate. Can text be bold or italics? Is any kind of undo part of any feature? Is there any kind of versioning? It doesn't have to be Git, but users will become extremely frustrated if everything they have entered in a note is wiped out by single keystroke. Can I paste text? Can I copy text out? Are things other than text supported yet? What kinds of text are supported? I'm going to switch to a katakana keyboard and enter Japanese text. Does this worry anyone? What are the size limits, per note, per account? Is there a list of devices that are supported, or anything that purports to support web pages fair game? After asking some basic questions it's time to turn attention to the core of the assignment.

Editing
Create, add text, remove text, log out and log back in to see the text as it was left.
Repeat this accross all devices.
Repeat this for letters in a robust number of alphabets as well as numbers and symbols. I'd start with Résumé since that's how a lot of people spell it in English, then mix in Spanish (accents) and German (umlauts), Cyrillic, and Japanese.

Sharing
Check that text entered on one devices appears on other devices. Exhaustive testing of creating notes in every browser-like application on each device and opening on every other device and browser is well beyond the time constraints. First, I'd assemble a list of devices and browsers popular enough to warrent testing. If the 80/20 rule holds true here, we can cover 80% of perspective users with just 20% of available devices.
Testing can be further accelerated by not exhaustively checking each against every, but check each against two others. For example, if you have identfied five browser device combinations to test, then create on 1, open on 2 and 3, then create on 2 and open on 3 and 4. Repeat until you create on number 5, then open on 1 and 2.





2 - Automation Exercise
Expect this exercise to take no more than 1.5 hrs

Brief

Starting with Wikipedia's https://en.wikipedia.org/wiki/Metis_(mythology) page, please test for the following:

a) the headings listed in the `Contents` box are used as headings on the page
b) the headings listed in the `Contents` box have functioning hyperlinks
c) in the _Personified concepts_, `Nike` has a popup that contains the following text:

In ancient Greek religion, Nike was a goddess who personified victory. Her Roman equivalent was Victoria.


d) in the _Personified concepts_, if you click on `Nike`, it takes you to a page that displays a family tree

* Caveats

The #hover method in c) opens the pop up, but only after waiting a short amount of time for the JavaScript code to load. The wait is set at a half second. Hard waits like this should be avoided generally, but seems appropriate in this case, as long as we're waiting long enough.

* How to run the test suite

Pull the code locally from github.

In the parkside_security_1 directory run the command:

bundle exec rspec --color --format doc 
